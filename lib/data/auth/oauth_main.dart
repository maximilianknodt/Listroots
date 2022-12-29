import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'authorization_code_grant.dart';
import '../oauth2.dart' as oauth2;

class OAuthMain {
  File? credentialsFile;

// Default-URL fuer das Erhalten des Autorisierungs-Codes
  final Uri authorizationEndpoint =
      Uri.parse("https://master.apis.dev.openstreetmap.org/oauth2/authorize");

// Default-URL fuer das Erhalten des Access-Tokens
  final Uri tokenEndpoint =
      Uri.parse('https://master.apis.dev.openstreetmap.org/oauth2/token');

// Redirect URL, an die der Token gesendet werden soll
// Wird per Intent-Filter freigeschaltet,
// damit Antworten an diese Adresse in der App bearbeitet werden koennen
  final Uri redirectURL = Uri.parse("https://listroots.web.app");

// Client ID, Client Secret und Scope durch Anmeldung der App im OSM Account erhalten
  final String identifier = 'JA-kNEC9Tdxz127PLPgb_6i3QPzxz87ifyn9JN056W0';
  final String secret = 'CfS-APnsBj-MpWBuElsvbd7hxZ_qSuiCUz2pRSxpPWw';
  final List<String> scope = ["write_api"];

  AuthorizationCodeGrant? grant;

  /// Ueberpruefen, ob Credentials abgespeichert sind
  Future<bool> credentialsExist() async {
    Directory credDir = await getApplicationDocumentsDirectory();
    credentialsFile = File(credDir.path + '/credentials.json');

    return await credentialsFile!.exists();
  }

  /// Client aus gespeicherten Credentials erzeugen
  Future<oauth2.Client> loadClient() async {
    var credentials =
        oauth2.Credentials.fromJson(await credentialsFile!.readAsString());
    log(credentialsFile!.readAsStringSync());
    return oauth2.Client(credentials, identifier: identifier, secret: secret);
  }

  /// Clienterzeugung durch AuthorizationGrant starten
  Future<oauth2.Client?> createClient() async {
    // Falls Credentials schon vorhanden, diese laden und Client zurueckgeben
    if (await credentialsExist()) {
      return await loadClient();
    }

    // Falls Credentials nicht vorhanden, muss uns OSM authorisieren
    grant = oauth2.AuthorizationCodeGrant(
        identifier, authorizationEndpoint, tokenEndpoint,
        secret: secret);

    if (grant == null) {
      log("grant is null", name: "createClient");
      return null;
    }

    // AuthorizationEndpoint mit zusaetzlichen Parametern (z.B. Scope)
    var authorizationUrl =
        grant!.getAuthorizationUrl(redirectURL, scopes: scope);

    await open(authorizationUrl);
    return null;
  }

  Future<oauth2.Client> saveClient(String code) async {
    var client = await grant!.handleAuthorizationResponse({"code": code});

    await credentialsFile!.writeAsString(client.credentials.toJson());
    return client;
  }

  Future<void> open(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw "Could not launch $url";
    } else {
      log(name: "open url", url.toString());
    }
  }
}

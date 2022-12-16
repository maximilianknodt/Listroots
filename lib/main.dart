import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listroots/data/auth/authorization_code.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app.dart';
import 'data/auth/authorization_code_grant.dart';
import 'data/auth/client.dart';
import 'data/auth/client_credentials_grant.dart';
import 'data/auth/utils.dart';
import 'data/oauth2.dart' as oauth2;

// -------------------------------
final credentialsFile = File('~/.myapp/credentials.json');

// -------------------------------

// Default-URL fuer das Erhalten des Autorisierungs-Codes
final Uri authorizationEndpoint =
    Uri.parse("https://master.apis.dev.openstreetmap.org/oauth2/authorize");

// Default-URL fuer das Erhalten des AccessTokens
final Uri tokenEndpoint =
    Uri.parse('https://master.apis.dev.openstreetmap.org/oauth2/token');

// This value indicates that the Authorization Server should return the authorization code
// in the browser's title bar. This option is useful if the client cannot listen on an HTTP port
// without significant modifications to the client. Windows applications possess this characteristic.
// Redirect URL
final Uri redirectURL = Uri.parse("https://listroots.web.app");

// Client ID, Client Secret und Scope durch Anmeldung der App im OSM Account erhalten
final String identifier = 'JA-kNEC9Tdxz127PLPgb_6i3QPzxz87ifyn9JN056W0';
final String secret = 'CfS-APnsBj-MpWBuElsvbd7hxZ_qSuiCUz2pRSxpPWw';
final String scope = "write_api";

// Hat zwei mal geklappt, dass der AuthCode aus dem Browser
// zum "normalen" Verhalten (kein Exeptionwurf) gefuert hatt
// Token wird durch Austausch mit dem AuthCode erhalten
final String accessToken = "gLBctggrv4RrMFzwaE_rPj9Ppm7vosZr5jd5f5aXExA";

void main() async {
  runApp(const App());

  //await credentialsFile.writeAsString(client.credentials.toJson());
}

AuthorizationCodeGrant? grant;

Future<oauth2.Client?> createClient() async {
  var exists = await credentialsFile.exists();

  // If the OAuth2 credentials have already been saved from a previous run, we
  // just want to reload them.
  if (exists) {
    var credentials =
        oauth2.Credentials.fromJson(await credentialsFile.readAsString());
    return oauth2.Client(credentials, identifier: identifier, secret: secret);
  }

  // If we don't have OAuth2 credentials yet, we need to get the resource owner
  // to authorize us. We're assuming here that we're a command-line application.
  grant = oauth2.AuthorizationCodeGrant(
      identifier, authorizationEndpoint, tokenEndpoint,
      secret: secret);

  List<String> sc = [scope];

  if (grant == null) {
    log("grant is null", name: "createClient");
    return null;
  }

  // A URL on the authorization server (authorizationEndpoint with some
  // additional query parameters). Scopes and state can optionally be passed
  // into this method.
  var authorizationUrl = grant!.getAuthorizationUrl(redirectURL, scopes: sc);

  await open(authorizationUrl);
  return null;
}

Future<void> open(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw "Could not launch $url";
  } else {
    log(name: "open url", url.toString());
  }
}

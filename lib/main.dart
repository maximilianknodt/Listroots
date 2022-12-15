import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:listroots/data/auth/authorization_code.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app.dart';
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
  //OAuthMain oAuthMain = OAuthMain();
  //oAuthMain.startAuthorization();

  //auth();

  var client = await createClient();

  // Once you have a Client, you can use it just like any other HTTP client.
  //print(await client.read(Uri.http('example.com', 'protected-resources.txt')));

  // Once we're done with the client, save the credentials file. This ensures
  // that if the credentials were automatically refreshed while using the
  // client, the new credentials are available for the next run of the
  // program.
  //await credentialsFile.writeAsString(client.credentials.toJson());
}

void auth() async {
  // -------------

  //getAutCode(authorizationEndpoint, identifier, secret, redirectURL);

  // -------------

  // Parameter, welche als Value an die tokenEndpoint URL formatiert angefuegt werden
  var paramsGetAccessToken = {
    "client_id": identifier,
    "grant_type": 'authorization_code',
    "code": "JRghhF9P6azIkwlrIPpRRPBn7ZRqzAW_Lt8Wbifzr-I",
    "redirect_uri": redirectURL.toString(),
    "client_secret": secret,
  };

  // Benutzerspezifische URL fuer das Erhalten des AccesTokens
  final Uri urlGetToken =
      addQueryParameters(tokenEndpoint, paramsGetAccessToken);

  var client = await clientCredentialsGrant(urlGetToken, identifier, secret);
  inspect(client);
}

Future<oauth2.Client> createClient() async {
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
  var grant = oauth2.AuthorizationCodeGrant(
      identifier, authorizationEndpoint, tokenEndpoint,
      secret: secret);

  List<String> sc = [scope];

  // A URL on the authorization server (authorizationEndpoint with some
  // additional query parameters). Scopes and state can optionally be passed
  // into this method.
  var authorizationUrl = grant.getAuthorizationUrl(redirectURL, scopes: sc);

  // Redirect the resource owner to the authorization URL. Once the resource
  // owner has authorized, they'll be redirected to `redirectUrl` with an
  // authorization code. The `redirect` should cause the browser to redirect to
  // another URL which should also have a listener.
  //
  // `redirect` and `listen` are not shown implemented here.
  await redirect(authorizationUrl);
  var responseUrl = await listen(redirectURL);
  log("listen done");

  // Once the user is redirected to `redirectUrl`, pass the query parameters to
  // the AuthorizationCodeGrant. It will validate them and extract the
  // authorization code to create a new Client.
  return grant.handleAuthorizationResponse(responseUrl.queryParameters);
}

Future<void> redirect(Uri url) async {
  inspect(url);
  if (!await launchUrl(url)) {
    throw "Could not launch $url";
  }
}

Future<Uri> listen(dynamic url) async {
  inspect(url);
  if (url.toString().startsWith(redirectURL.toString())) {
    log(redirectURL.toString());
    return url;
  }
  return Uri();
}

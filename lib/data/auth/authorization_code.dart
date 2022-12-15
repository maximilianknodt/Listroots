import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'utils.dart';

void getAutCode(
    Uri authorizationEndpoint, String identifier, String? secret, Uri redirect,
    {Iterable<String>? scopes,
    bool basicAuth = true,
    http.Client? httpClient,
    String? delimiter,
    Map<String, dynamic> Function(MediaType? contentType, String body)?
        getParameters}) async {
  delimiter ??= ' ';

  var body = {'response_type': 'code'};

  var headers = <String, String>{};

  if (basicAuth) {
    headers['Authorization'] = basicAuthHeader(identifier, secret!);
  } else {
    body['client_id'] = identifier;
    if (secret != null) body['client_secret'] = secret;
  }

  if (scopes != null && scopes.isNotEmpty) {
    body['scope'] = scopes.join(delimiter);
  }

  var parameters = {
    'client_id': identifier,
    'client_secret': secret!,
    'redirect_uri': redirect.toString(),
    'response_type': 'code',
    'scope': "write_api"
  };

  Uri authEndpoint = addQueryParameters(authorizationEndpoint, parameters);
  inspect(authEndpoint);

  httpClient ??= http.Client();
  var response =
      await httpClient.post(authEndpoint, headers: headers, body: body);

  log("Response:");
  inspect(response);
}

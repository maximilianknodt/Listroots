import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart';

class User extends http.BaseClient {
  final String? id;
  final String? secret;
  http.Client? _client;
  //http.Response response;

  String get initials => "JG";

  User(this.id, this.secret, {http.Client? client})
      : _client = client ?? http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // TODO: implement send
    throw UnimplementedError();
  }

  var accessToken = {};
  // laut https://wiki.openstreetmap.org/wiki/OAuth#OAuth_2.0_2 sieht das wie folgt aus:
  // { "access_token":"<ACCESS_TOKEN>",
  //   "token_type":"Bearer",
  //   "scope":"read_prefs write_api",
  //   "created_at":1646669786
  // };
}

import 'dart:convert';

import 'package:dartpedia_cli/github_user.dart';
import 'package:http/http.dart' as http;

Future<GithubUser> getGithubUser(String username) async {
  final http.Client client = http.Client();

  try {
    final Uri url = Uri.https('api.github.com', '/users/$username');

    final http.Response response = await client.get(
      url,
      headers: {
        'X-GitHub-Api-Version': '2026-03-10',
        'Accept': 'application/vnd.github+json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      return GithubUser.fromJson(jsonData);
    } else {
      throw Exception(response);
    }
  } on FormatException {
    rethrow;
  } finally {
    client.close();
  }
}

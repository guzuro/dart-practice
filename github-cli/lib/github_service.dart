import 'dart:convert';

import 'package:dartpedia_cli/models/github_repository.dart';
import 'package:dartpedia_cli/models/github_user.dart';
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

Future<List<GithubRepository>> getGithubRepos(String username) async {
  final http.Client client = http.Client();

  try {
    final Uri url = Uri.https('api.github.com', '/users/$username/repos');

    final http.Response response = await client.get(
      url,
      headers: {
        'X-GitHub-Api-Version': '2026-03-10',
        'Accept': 'application/vnd.github+json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData.map((item) => GithubRepository.fromJson(item)).toList();
    } else {
      throw Exception(response);
    }
  } on FormatException {
    rethrow;
  } finally {
    client.close();
  }
}

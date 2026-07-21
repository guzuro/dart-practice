// https://docs.github.com/rest/users/users?apiVersion=2026-03-10#get-a-user
class GithubUser {
  final String login;
  final String? name;
  final String? bio;
  final int followers;
  final int following;
  final int publicRepos;
  final String htmlUrl;

  GithubUser({
    required this.login,
    this.name,
    this.bio,
    required this.followers,
    required this.following,
    required this.publicRepos,
    required this.htmlUrl,
  });

  @override
  String toString() {
    return '''
  ==========================
  GitHub User

  Login: $login
  Name: ${name ?? '-'}

  Bio:
  ${bio ?? '-'}

  Followers: $followers
  Following: $following

  Public repositories: $publicRepos

  Profile:
  $htmlUrl
  ==========================
''';
  }

  factory GithubUser.fromJson(Map<String, dynamic> json) {
    print(json);
    return GithubUser(
      login: json['login'] as String,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      followers: json['followers'] as int,
      following: json['following'] as int,
      publicRepos: json['public_repos'] as int,
      htmlUrl: json['html_url'] as String,
    );
  }
}

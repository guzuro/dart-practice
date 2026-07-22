class GithubRepository {
  final String name;
  final String htmlUrl; //html_url
  final int forksCount; //forks_count
  final int stargazersCount; //stargazers_count
  final int watchersCount; //watchers_count
  final String? language; //language

  GithubRepository({
    required this.name,
    required this.htmlUrl,
    required this.forksCount,
    required this.stargazersCount,
    required this.watchersCount,
    this.language,
  });

  @override
  String toString() {
    return '''
    == $name
    ⭐ $stargazersCount | 🍴 $forksCount | 👁️ $watchersCount 
    🎤 ${language ?? '-'}
    Профиль: $htmlUrl
''';
  }

  factory GithubRepository.fromJson(Map<String, dynamic> json) {
    return GithubRepository(
      name: json['name'] as String,
      htmlUrl: json['html_url'] as String, //html_url
      forksCount: json['forks_count'] as int, //forks_count
      stargazersCount: json['stargazers_count'] as int, //stargazers_count
      watchersCount: json['watchers_count'] as int, //watchers_count
      language: json['language'] as String?, //language
    );
  }
}

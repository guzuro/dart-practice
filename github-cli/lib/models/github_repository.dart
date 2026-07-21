class GithubRepository {
  String name;
  String htmlUrl; //html_url
  int forksCount; //forks_count
  int stargazersCount; //stargazers_count
  int watchersCount; //watchers_count
  String? language; //language

  GithubRepository({
    required this.name,
    required this.htmlUrl,
    required this.forksCount,
    required this.stargazersCount,
    required this.watchersCount,
  });
}

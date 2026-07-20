import 'package:dartpedia_cli/github_service.dart';

void main(List<String> arguments) async {
  var result = await getGithubUser('guzuro');

  print(result);
}

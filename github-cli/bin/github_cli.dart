import 'package:dartpedia_cli/github_service.dart';

Future<void> getUserController(List<String> data) async {
  if (data.isEmpty) {
    print("username не передан");
    return;
  }

  final result = await getGithubUser(data.first);
  print(result);
}

Future<void> getRepositoriesController(List<String> data) async {
  if (data.isEmpty) {
    print("username не передан");
    return;
  }

  final result = await getGithubRepos(data.first);
  print('''
===============

Репозитории: ${result.length}
''');

  result.forEach(print);

  print('===============');
}

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print("Аргументы не переданы");
    return;
  }

  final argumentValue = arguments.sublist(1);

  switch (arguments.first) {
    case 'user':
      await getUserController(argumentValue);
      break;
    case 'repo':
      await getRepositoriesController(argumentValue);
      break;
    default:
      print("Неизвестная команда");
  }
}

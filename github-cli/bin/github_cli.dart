import 'package:dartpedia_cli/github_service.dart';

Future<void> getUserController(List<String> data) async {
  if (data.isEmpty) {
    print("username не передан");
    return;
  }

  final result = await getGithubUser(data.first);
  print(result);
}

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print("Аргументы не переданы");
    return;
  }

  switch (arguments.first) {
    case 'user':
      await getUserController(arguments.sublist(1));
      break;
    default:
      print("Неизвестная команда");
  }
}

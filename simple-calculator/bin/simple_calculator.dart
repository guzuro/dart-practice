import 'dart:io';

num resolveAction(String action, num a, num b) {
  switch (action) {
    case "+":
      return a + b;
    case "-":
      return a - b;
    case "/":
      if (b == 0) {
        throw "Деление на ноль невозможно";
      }

      return a / b;
    case "*":
      return a * b;
    default:
      throw "Неизвестное действие - $action";
  }
}

num readValue(String prompt) {
  while (true) {
    print(prompt);
    final input = stdin.readLineSync() ?? "";
    final value = num.tryParse(input);

    if (value != null) {
      return value;
    }

    print('ошибка: Введите число');
  }
}

const actions = ['+', '-', '/', '*'];

void main(List<String> arguments) {
  num a = readValue("Введите первое число:");

  String? action;
  while (action == null) {
    print('Введите действие:');
    String input = stdin.readLineSync() ?? "";

    if (actions.contains(input)) {
      action = input;
    } else {
      print("ошибка: Введите одно из действий $actions");
    }
  }

  num b = readValue("Введите второе число:");

  try {
    final result = resolveAction(action, a, b);
    print("$a $action $b = $result");
  } catch (e) {
    print("Ошибка: $e");
  }
}

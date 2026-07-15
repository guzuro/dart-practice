import 'dart:io';

num resolveAction(String action, int a, int b) {
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

void main(List<String> arguments) {
  int? a;
  String? action;
  int? b;

  while (a == null) {
    print('Введите первое число');
    String input = stdin.readLineSync() ?? "";
    a = int.tryParse(input);
  }

  while (action == null) {
    print('Введите действие');
    String input = stdin.readLineSync() ?? "";

    if (['+', '-', '/', '*'].contains(input)) {
      action = input;
    } else {
      print("Введите одно из действий +,-,/,*");
    }
  }

  while (b == null) {
    print('Введите второе число');
    String input = stdin.readLineSync() ?? "";
    b = int.tryParse(input);
  }

  try {
    var result = resolveAction(action, a, b);
    print("$a $action $b = $result");
  } catch (e) {
    print("Ошибка: $e");
  }
}

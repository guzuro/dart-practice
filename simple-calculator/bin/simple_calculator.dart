import 'dart:io';

import 'package:simple_calculator/operation_model.dart';

num calculate(String action, num a, num b) {
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
final List<OperationModel> history = [];

void calculator() {
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
    final result = calculate(action, a, b);
    final operation = OperationModel(a, b, action, result);

    history.add(operation);
    print(operation.toString());
  } catch (e) {
    print("Ошибка: $e");
  }
}

void showHistory() {
  history.forEach(print);
}

void main(List<String> arguments) {
  while (true) {
    print("Что будем делать дальше? \n 1.Калькулятор \n 2.История");
    String input = stdin.readLineSync() ?? "";

    switch (input) {
      case '1':
        calculator();
      case "2":
        showHistory();
    }
  }
}

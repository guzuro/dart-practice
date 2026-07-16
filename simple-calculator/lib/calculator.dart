num calculate(String action, num a, num b) {
  switch (action) {
    case "+":
      return a + b;
    case "-":
      return a - b;
    case "/":
      if (b == 0) {
        throw Exception('Деление на ноль невозможно');
      }

      return a / b;
    case "*":
      return a * b;
    default:
      throw Exception("Неизвестное действие - $action");
  }
}

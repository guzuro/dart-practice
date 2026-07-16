import 'package:simple_calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  group('calculate', () {
    test('сложение', () {
      expect(calculate('+', 1, 1), equals(2));
    });

    test('сложение с b<0', () {
      expect(calculate('+', 5, -5), equals(0));
    });

    test('сложение отрицательных чисел', () {
      expect(calculate('+', -5, -5), equals(-10));
    });

    test('вычитание минус на минус', () {
      expect(calculate('-', -5, -5), equals(0));
    });

    test('Умножение', () {
      expect(calculate('*', -5, 0), equals(0));
    });

    test('умножение дробное ', () {
      expect(calculate('*', 10, 0.5), 5.0);
    });

    test('деление', () {
      expect(calculate('/', 10, 5), 2);
    });

    test('деление дробное', () {
      expect(calculate('/', 10, 0.2), 50);
    });

    test('деление на ноль выкидает ексепшн', () {
      expect(() => calculate('/', 10, 0), throwsException);
    });

    test('неизвестное действие', () {
      expect(() => calculate('qwe', 10, 0), throwsException);
    });
  });
}

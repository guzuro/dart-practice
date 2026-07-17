import 'package:books_library/library_model.dart';
import 'package:test/test.dart';

void main() {
  group('Library', () {
    late Library library;

    setUp(() {
      library = Library();
      library.addBook(title: "Book 1", author: "Author 1");
      library.addBook(title: "Book 2", author: "Author 2");
    });

    test('добавить книгу', () {
      library.addBook(title: "Test", author: "Test author");

      expect(library.store.length, equals(3));
    });

    test('Удалить существую книгу', () {
      expect(library.deleteBook(1), isTrue);
    });

    test('Удалить не существующую книгу', () {
      expect(library.deleteBook(55), isFalse);
    });

    test('Получить книгу по названию полному', () {
      final result = library.getBookByTitle("book 1");

      expect(result.first.id, equals(1));
    });

    test('Получить книгу по названию вхождение', () {
      expect(library.getBookByTitle("boo").length, equals(2));
    });

    test('Получить книгу по ID', () {
      expect(library.getBookById(2), isNotNull);
    });

    test('не Получить книгу по ID', () {
      expect(library.getBookById(44), isNull);
    });
  });
}

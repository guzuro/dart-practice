import 'package:books_library/book_model.dart';
import 'package:books_library/library_model.dart';
import 'dart:io';
import 'dart:convert';

final library = Library();

String readString(String prompt) {
  print(prompt);
  return stdin.readLineSync(encoding: utf8) ?? "";
}

void addBookController() {
  String title = readString("Название книги:");
  String author = readString("Автор книги:");

  library.addBook(author: author, title: title);

  print("👌 Книга добавлена\n_________");
}

void showBooksController() {
  library.store.forEach(print);
}

void findBookController() {
  String method = readString(
    "Как будем искать книгу? \n 1.По названию. \n2.По ID.",
  );

  switch (method) {
    case "1":
      String title = readString("Введите азвание книги:");
      final books = library.getBookByTitle(title);

      if (books.isNotEmpty) {
        print("Найденные книги:");
        books.forEach(print);
      } else {
        print("Книги с таким названием не найдены");
      }
      break;
    case "2":
      String id = readString("Введите ID книги:");
      final book = library.getBookById(id);

      if (book != null) {
        print(book);
      } else {
        print("Книгa с таким ID не найдена");
      }
      break;
    default:
      print("Команда не найдена");
  }

  print("_______");
}

void deleteBookController() {
  String id = readString("Введите ID книги:");
  final result = library.deleteBook(id);

  if (result) {
    print("👌 Книга удалена\n___________");
  } else {
    print("Такой книги не существует\n___________");
  }
}

void main(List<String> arguments) {
  while (true) {
    print(
      "1.Добавить книгу. \n2.Показать все книги. \n3.Найти книги. \n4.Удалить книгу. \n5.Выйти.",
    );

    String input = stdin.readLineSync() ?? '';

    switch (input) {
      case "1":
        addBookController();
      case "2":
        showBooksController();
      case "3":
        findBookController();
      case "4":
        deleteBookController();
      case "5":
        return;
      default:
        print('Неизвестная команда');
    }
  }
}

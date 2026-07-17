import 'package:books_library/book_model.dart';
import 'package:books_library/library_model.dart';
import 'package:uuid/uuid.dart';
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

  library.addBook(BookModel(Uuid().v1(), author, title));
  print("👌 Книга добавлена");
  print("_______");
}

void showBooksController() {
  library.store.forEach(print);
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
      default:
        print('Неизвестная команда');
    }
  }
}

import 'dart:collection';

import 'package:books_library/book_model.dart';

class Library {
  final List<BookModel> _store = [];

  UnmodifiableListView<BookModel> get store => UnmodifiableListView(_store);

  void addBook(BookModel book) {
    _store.add(book);
  }

  void deleteBook(String id) {
    _store.removeWhere((book) => book.id == id);
  }

  Iterable<BookModel> getBookByTitle(String title) {
    return _store.where((book) => book.title == title);
  }

  BookModel getBookById(String id) {
    return _store.firstWhere((book) => book.id == id);
  }
}

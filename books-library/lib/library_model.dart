import 'package:books_library/book_model.dart';
import 'package:collection/collection.dart';

class Library {
  final List<BookModel> _store = [];

  UnmodifiableListView<BookModel> get store => UnmodifiableListView(_store);

  void addBook({required String title, required String author}) {
    _store.add(BookModel(getNextBookId(), author, title));
  }

  void deleteBook(String id) {
    _store.removeWhere((book) => book.id == int.tryParse(id));
  }

  Iterable<BookModel> getBookByTitle(String title) {
    return _store.where(
      (book) =>
          book.title.toLowerCase().trim().contains(title.toLowerCase().trim()),
    );
  }

  BookModel? getBookById(String id) {
    return _store.firstWhereOrNull((book) => book.id == int.tryParse(id));
  }

  int getNextBookId() {
    final lastBook = _store.lastOrNull;

    if (lastBook != null) {
      return lastBook.id + 1;
    }

    return _store.length + 1;
  }
}

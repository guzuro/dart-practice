import 'package:books_library/book_model.dart';
import 'package:collection/collection.dart';

class Library {
  final List<BookModel> _store = [];

  UnmodifiableListView<BookModel> get store => UnmodifiableListView(_store);

  void addBook({required String title, required String author}) {
    _store.add(BookModel(getNextBookId(), author, title));
  }

  bool deleteBook(String id) {
    final bookIndex = _store.indexWhere((book) => book.id == int.tryParse(id));

    if (bookIndex != -1) {
      _store.removeAt(bookIndex);

      return true;
    } else {
      return false;
    }
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

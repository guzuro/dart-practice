class BookModel {
  final String id;
  final String title;
  final String author;

  BookModel(this.id, this.author, this.title);

  @override
  String toString() {
    return "Название: $title, автор: $author";
  }
}

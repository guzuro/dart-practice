class BookModel {
  final int id;
  final String title;
  final String author;

  BookModel(this.id, this.author, this.title);

  @override
  String toString() {
    return "$id | Название: $title | Автор: $author";
  }
}

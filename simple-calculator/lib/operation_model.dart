class OperationModel {
  final num a;
  final num b;
  final String action;
  final num result;

  OperationModel(this.a, this.b, this.action, this.result);

  @override
  String toString() {
    return "$a $action $b = $result";
  }
}

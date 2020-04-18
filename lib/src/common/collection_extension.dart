extension ListExtension<T> on List<T> {
  List<R> mapToList<R>(R Function(T) convert) {
    return this.map(convert).toList();
  }
}

class IOSExceptionParser {
  final String _errorDescription;

  IOSExceptionParser(this._errorDescription);

  String getUrlFromErrorDescription() {
    var regExp = RegExp('moz-extension:([^,]+)');
    var firstMatch = regExp.firstMatch(_errorDescription);
    return _errorDescription.substring(firstMatch.start, firstMatch.end);
  }
}

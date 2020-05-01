class IOSExceptionParser {
  final String _errorDescription;

  IOSExceptionParser(this._errorDescription);

  String getUrlFromErrorDescription() {
    var regExp = RegExp('moz-extension:([^,]+)');
    if (regExp.hasMatch(_errorDescription)) {
      var firstMatch = regExp.firstMatch(_errorDescription);
      return _errorDescription.substring(firstMatch.start, firstMatch.end);
    } else
      throw FormatException;
  }
}
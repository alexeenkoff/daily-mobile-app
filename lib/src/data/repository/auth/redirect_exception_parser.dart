class RedirectExceptionParser {
  static bool canParse(String error) {
    return error
        .contains('Redirection to URL with a scheme that is not HTTP(S)');
  }

  final String _error;

  

  RedirectExceptionParser(this._error);
}

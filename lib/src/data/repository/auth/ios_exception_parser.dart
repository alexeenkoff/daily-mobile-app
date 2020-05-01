class IOSExceptionParser {
  final String _exceptionDescription;

  String string =
      'Error Domain= Code=0 "Redirection to URL with a scheme that is not HTTP(S)" UserInfo={_WKRecoveryAttempterErrorKey=<WKReloadFrameErrorRecoveryAttempter: 0x600002534ea0>, NSErrorFailingURLStringKey=moz-extension://f86cc5f4-01cb-9542-8c9c-41bde03d68b5/index.html?provider=github&code=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1ODgzNTg4MTEuOTgyLCJwcm92aWRlckNvZGUiOiI0MzQ0NGVjZDMxMTA3NzhkMjE5NyIsInByb3ZpZGVyIjoiZ2l0aHViIiwiY29kZUNoYWxsZW5nZSI6IlFabnd0TXFPcHpYM0ZRd3ZfZDZ3MXU5c0s5bjVxZ19vYWlRSVJyamN5WkUiLCJpYXQiOjE1ODgzNTg3NTEsImF1ZCI6IkRhaWx5IiwiaXNzIjoiRGFpbHkgQVBJIn0.CDrD7lqAkUjROx4gZvzxUUzxzE8eo9BUerMb8TMrwkk, NSErrorFailingURLKey=moz-extension://f86cc5f4-01cb-9542-8c9c-41bde03d68b5/index.html?provider=github&code=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1ODgzNTg4MTEuOTgyLCJwcm92aWRlckNvZGUiOiI0MzQ0NGVjZDMxMTA3NzhkMjE5NyIsInByb3ZpZGVyIjoiZ2l0aHViIiwiY29kZUNoYWxsZW5nZSI6IlFabnd0TXFPcHpYM0ZRd3ZfZDZ3MXU5c0s5bjVxZ19vYWlRSVJyamN5WkUiLCJpYXQiOjE1ODgzNTg3NTEsImF1ZCI6IkRhaWx5IiwiaXNzIjoiRGFpbHkgQVBJIn0.CDrD7lqAkUjROx4gZvzxUUzxzE8eo9BUerMb8TMrwkk, NSLocalizedDescription=Redirection to URL with a scheme that is not HTTP(S)}';

  IOSExceptionParser(this._exceptionDescription);

  String getUrlFromErrorDescription() {
    return string;
  }
}

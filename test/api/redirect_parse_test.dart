import 'package:daily_mobile_app/src/ui/auth/redirect_url_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('github auth redirect parse', () {
    String url =
        'moz-extension://f86cc5f4-01cb-9542-8c9c-41bde03d68b5/index.html?provider=github&code=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1ODgzMzk0NDYuNDU1LCJwcm92aWRlckNvZGUiOiI0YTIyYjBkOWQ3MzU4YWJhMDZhYiIsInByb3ZpZGVyIjoiZ2l0aHViIiwiY29kZUNoYWxsZW5nZSI6IlFabnd0TXFPcHpYM0ZRd3ZfZDZ3MXU5c0s5bjVxZ19vYWlRSVJyamN5WkUiLCJpYXQiOjE1ODgzMzkzODYsImF1ZCI6IkRhaWx5IiwiaXNzIjoiRGFpbHkgQVBJIn0.SdZu1O9DFULGVrYFKg_ByphNaOZPzC2JojpZmx9KAjI';
    final parser = GitHubUrlParser();
    final RedirectResult result = parser.parseUrl(url);
    assert(result != null);
    assert(result.provider == 'github');
    assert(result.providerCode == '4a22b0d9d7358aba06ab');
    assert(result.exp == 1588339446.455);
    assert(
        result.codeChallenge == 'QZnwtMqOpzX3FQwv_d6w1u9sK9n5qg_oaiQIRrjcyZE');
    assert(result.iat == 1588339386);
    assert(result.aud == "Daily");
    assert(result.iss == "Daily API");
  });
}

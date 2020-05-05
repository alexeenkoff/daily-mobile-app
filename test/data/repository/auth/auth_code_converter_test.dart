import 'package:daily_mobile_app/src/data/repository/auth/auth_code_converter.dart';
import 'package:daily_mobile_app/src/domain/entities/auth/auth_rediredct_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('convert redirect to gwt code', () {
    final _code =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1ODg2MjYxMzMuNTgyLCJwcm92aWRlckNvZGUiOiIyZTEzNmMxOWM0YzliMTE2N2M5MCIsInByb3ZpZGVyIjoiZ2l0aHViIiwiY29kZUNoYWxsZW5nZSI6Img4RTJBd3h3Vy1jNTR6dzhaYWU5RG51bDVNZ2l3cDBjeFhnYkY3M0ZnaTAiLCJpYXQiOjE1ODg2MjYwNzMsImF1ZCI6IkRhaWx5IiwiaXNzIjoiRGFpbHkgQVBJIn0.ICpodEjfZ2xdsMmovZinA9ltuy9xxqh0UN9tIlHN9ws';
    final _redirect = AuthRedirect(
        'github',
        '2e136c19c4c9b1167c90',
        1588626133.582,
        'h8E2AwxwW-c54zw8Zae9Dnul5Mgiwp0cxXgbF73Fgi0',
        1588626073,
        'Daily',
        'Daily API');
    var result = AuthCodeConverter(_redirect).convert();
    assert(_code == result);
  });
}

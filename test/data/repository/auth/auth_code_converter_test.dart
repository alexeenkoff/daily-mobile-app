import 'package:daily_mobile_app/src/data/repository/auth/auth_code_converter.dart';
import 'package:daily_mobile_app/src/domain/entities/auth/auth_rediredct_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('convert redirect to jwt code', () {
    final _redirect = AuthRedirect(
        'github',
        '2e136c19c4c9b1167c90',
        1588626133.582,
        'h8E2AwxwW-c54zw8Zae9Dnul5Mgiwp0cxXgbF73Fgi0',
        1588626073,
        'Daily',
        'Daily API');
    AuthCodeConverter(_redirect).convert();
  });
}

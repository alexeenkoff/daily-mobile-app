import 'package:daily_mobile_app/src/data/repository/auth/web_auth_url_provider.dart';
import 'package:daily_mobile_app/src/domain/interfaces/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final correctUrl =
      'https://github.com/login?client_id=92d76a890e5c6144a4af&return_to=/login/oauth/authorize?access_type=offline&client_id=92d76a890e5c6144a4af&redirect_uri=https://app.dailynow.co/v1/auth/callback&response_type=code&scope=user:email&state={"provider":"github","redirect_uri":"moz-extension://f86cc5f4-01cb-9542-8c9c-41bde03d68b5/index.html?provider=github","code_challenge":"QZnwtMqOpzX3FQwv_d6w1u9sK9n5qg_oaiQIRrjcyZE"}';
  test('create_auth_url', () {
    final provider = AuthUrlProviderImpl();
    final resultUrl = provider.getUrl(
        Provider.github, 'QZnwtMqOpzX3FQwv_d6w1u9sK9n5qg_oaiQIRrjcyZE');
    assert(resultUrl == correctUrl);
  });
}

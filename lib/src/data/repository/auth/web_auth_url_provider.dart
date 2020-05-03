import 'package:daily_mobile_app/src/domain/interfaces/auth_repository.dart';

abstract class WebAuthUrlProvider {
  String getUrl(Provider provider, String codeChallenge);
}

class AuthUrlProviderImpl extends WebAuthUrlProvider {
  static const _googleAuthUrl = ''; //TODO
  
  @override
  String getUrl(Provider provider, String codeChallenge) {
    return provider == Provider.github
        ? _githubUrl(codeChallenge)
        : _googleAuthUrl;
  }

  String _githubUrl(String challenge) {
    return 'https://github.com/login?client_id=92d76a890e5c6144a4af&return_to=/login/oauth/authorize?access_type=offline&client_id=92d76a890e5c6144a4af&redirect_uri=https://app.dailynow.co/v1/auth/callback&response_type=code&scope=user:email&state={"provider":"github","redirect_uri":"moz-extension://f86cc5f4-01cb-9542-8c9c-41bde03d68b5/index.html?provider=github","code_challenge":"$challenge"}';
  }
}

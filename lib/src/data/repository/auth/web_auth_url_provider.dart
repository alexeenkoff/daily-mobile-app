import 'package:daily_mobile_app/src/domain/interfaces/auth_repository.dart';

abstract class WebAuthUrlProvider {
  String getUrl(Provider provider);
}

class AuthUrlProviderImpl extends WebAuthUrlProvider {
  static const _githubAuthUrl =
      'https://github.com/login?client_id=92d76a890e5c6144a4af&return_to=%2Flogin%2Foauth%2Fauthorize%3Faccess_type%3Doffline%26client_id%3D92d76a890e5c6144a4af%26redirect_uri%3Dhttps%253A%252F%252Fapp.dailynow.co%252Fv1%252Fauth%252Fcallback%26response_type%3Dcode%26scope%3Duser%253Aemail%26state%3D%257B%2522provider%2522%253A%2522github%2522%252C%2522redirect_uri%2522%253A%2522moz-extension%253A%252F%252Ff86cc5f4-01cb-9542-8c9c-41bde03d68b5%252Findex.html%253Fprovider%253Dgithub%2522%252C%2522code_challenge%2522%253A%2522QZnwtMqOpzX3FQwv_d6w1u9sK9n5qg_oaiQIRrjcyZE%2522%257D';
  static const _googleAuthUrl = ''; //TODO

  @override
  String getUrl(Provider provider) {
    return provider == Provider.github ? _githubAuthUrl : _googleAuthUrl;
  }
}

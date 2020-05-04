import 'package:daily_mobile_app/src/data/repository/auth/web_auth_url_provider.dart';
import 'package:daily_mobile_app/src/domain/interfaces/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final correctUrl =
      'https://github.com/login?client_id=7b514cee17923d0acedc&return_to=%2Flogin%2Foauth%2Fauthorize%3Faccess_type%3Doffline%26client_id%3D92d76a890e5c6144a4af%26redirect_uri%3Dhttps%253A%252F%252Fapp.dailynow.co%252Fv1%252Fauth%252Fcallback%26response_type%3Dcode%26scope%3Duser%253Aemail%26state%3D%257B%2522provider%2522%253A%2522github%2522%252C%2522redirect_uri%2522%253A%2522moz-extension%253A%252F%252F089a6695-649e-de41-8950-df12d66f2140%252Findex.html%253Fprovider%253Dgithub%2522%252C%2522code_challenge%2522%253A%2522QZnwtMqOpzX3FQwv_d6w1u9sK9n5qg_oaiQIRrjcyZE%2522%257D';
  test('create_auth_url', () {
    final provider = AuthUrlProviderImpl();
    final resultUrl = provider.getUrl(
        Provider.github, 'QZnwtMqOpzX3FQwv_d6w1u9sK9n5qg_oaiQIRrjcyZE');
    assert(resultUrl == correctUrl);
  });
}

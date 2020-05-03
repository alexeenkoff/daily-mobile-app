import 'package:daily_mobile_app/src/data/repository/auth/ios_exception_parser.dart';
import 'package:daily_mobile_app/src/data/repository/auth/web_auth_url_provider.dart';
import 'package:daily_mobile_app/src/domain/interfaces/auth_repository.dart';
import 'package:webview_flutter/platform_interface.dart';

class AuthService {
  final WebAuthUrlProvider _webAuthUrlProvider;
  final AuthRepository _authRepository;
  final _mozillaExtensionFormat = 'moz-extension://';

  AuthService(this._webAuthUrlProvider, this._authRepository);

  String authUrl;

  void initState(Provider provider) {
    authUrl = _webAuthUrlProvider.getUrl(provider,'');
  }

  void pageLoaded(String url) {
    if (url.contains(_mozillaExtensionFormat)) {
      final redirect = _authRepository.parseRedirectUrl(url);
      final x = 0;
    }
  }

  void pageLoadFailed(WebResourceError error) {
    if (error.description.toString().contains(_mozillaExtensionFormat)) {
      try {
        final url =
            IOSExceptionParser(error.description).getUrlFromErrorDescription();
        pageLoaded(url);
      } on FormatException catch (e) {
        throw e;
      }
    }
  }
}

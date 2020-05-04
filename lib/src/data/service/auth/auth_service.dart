import 'package:daily_mobile_app/src/common/lazy.dart';
import 'package:daily_mobile_app/src/data/repository/auth/ios_exception_parser.dart';
import 'package:daily_mobile_app/src/data/repository/auth/web_auth_url_provider.dart';
import 'package:daily_mobile_app/src/domain/entities/auth/code_challenge.dart';
import 'package:daily_mobile_app/src/domain/interfaces/auth_repository.dart';
import 'package:webview_flutter/platform_interface.dart';

class AuthService {
  final WebAuthUrlProvider _webAuthUrlProvider;
  final AuthRepository _authRepository;
  final _mozillaExtensionFormat = 'moz-extension://';
  Lazy<CodeChallenge> _codeChallenge;

  AuthService(
      WebAuthUrlProvider _webAuthUrlProvider, AuthRepository _authRepository)
      : this._webAuthUrlProvider = _webAuthUrlProvider,
        this._authRepository = _authRepository {
    _codeChallenge = Lazy(() => _authRepository.generateChallenge());
  }

  String authUrl;

  void initState(Provider provider) {
    authUrl =
        _webAuthUrlProvider.getUrl(provider, _codeChallenge.value().challenge);
  }

  void loadPageSuccess(String url) {
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
        loadPageSuccess(url);
      } on FormatException catch (e) {
        throw e;
      }
    }
  }
}

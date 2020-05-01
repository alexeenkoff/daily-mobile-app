import 'package:daily_mobile_app/src/data/repository/auth/web_auth_url_provider.dart';
import 'package:daily_mobile_app/src/domain/interfaces/auth_repository.dart';

class AuthService {
  final WebAuthUrlProvider _webAuthUrlProvider;
  final AuthRepository _authRepository;

  AuthService(this._webAuthUrlProvider, this._authRepository);

  String authUrl;

  void initState(Provider provider) {
    authUrl = _webAuthUrlProvider.getUrl(provider);
  }
}

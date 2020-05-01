import 'package:daily_mobile_app/src/data/repository/auth/redirect_url_parser.dart';
import 'package:daily_mobile_app/src/data/repository/auth/web_auth_url_provider.dart';
import 'package:daily_mobile_app/src/domain/entities/auth_rediredct_result.dart';
import 'package:daily_mobile_app/src/domain/interfaces/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RedirectUrlParser _redirectUrlParser;

  AuthRepositoryImpl(this._redirectUrlParser);


  @override
  AuthRedirectResult parseRedirectUrl(String url) {
    return _redirectUrlParser.parseUrl(url);
  }
}

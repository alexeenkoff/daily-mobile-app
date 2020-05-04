import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:daily_mobile_app/src/domain/entities/auth/auth_rediredct_result.dart';

abstract class RedirectUrlParser {
  AuthRedirectResult parseUrl(String url);
}

class GitHubUrlParser extends RedirectUrlParser {
  @override
  AuthRedirectResult parseUrl(String url) {
    final uri = Uri.dataFromString(url);
    final provider = uri.queryParameters['provider'];
    final jwtCode = uri.queryParameters['code'];
    final parsedToken = JWT.parse(jwtCode);
    final providerCode = parsedToken.getClaim('providerCode');
    final exp = parsedToken.getClaim('exp');
    final codeChallenge = parsedToken.getClaim('codeChallenge');
    final iat = parsedToken.getClaim('iat');
    final aud = parsedToken.getClaim('aud');
    final iss = parsedToken.getClaim('iss');
    return AuthRedirectResult(
        provider, providerCode, exp, codeChallenge, iat, aud, iss);
  }
}



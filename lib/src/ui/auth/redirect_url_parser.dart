import 'package:corsac_jwt/corsac_jwt.dart';

abstract class RedirectUrlParser {
  RedirectResult parseUrl(String url);
}

class GitHubUrlParser extends RedirectUrlParser {
  @override
  RedirectResult parseUrl(String url) {
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
    return RedirectResult(
        provider, providerCode, exp, codeChallenge, iat, aud, iss);
  }
}

class RedirectResult {
  final String provider;
  final String providerCode;
  final double exp;
  final String codeChallenge;
  final int iat;
  final String aud;
  final String iss;

  RedirectResult(this.provider, this.providerCode, this.exp,
      this.codeChallenge, this.iat, this.aud, this.iss);
}

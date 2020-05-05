import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:daily_mobile_app/src/Env.dart';
import 'package:daily_mobile_app/src/domain/entities/auth/auth_rediredct_result.dart';

class AuthCodeConverter {
  final AuthRedirect _redirect;

  AuthCodeConverter(this._redirect);

  String convert() {
    final token = JWTBuilder()
      ..expiresAt = DateTime.now().add(new Duration(minutes: 3))
      ..issuer = _redirect.iss
      ..audience = _redirect.aud
      ..setClaim('providerCode', _redirect.providerCode)
      ..setClaim('provider', _redirect.provider)
      ..setClaim('codeChallenge', _redirect.codeChallenge)
      ..getToken();
    final signer = new JWTHmacSha256Signer(Env.jwtHash);
    final signedToken = token.getSignedToken(signer);
    return signedToken.toString();
  }
}

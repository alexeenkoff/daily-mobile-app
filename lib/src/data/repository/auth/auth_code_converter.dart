import 'package:corsac_jwt/corsac_jwt.dart';
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
    final signer = new JWTHmacSha256Signer('|r+.2!!!.Qf_-|63*%.D');
    final signedToken = token.getSignedToken(signer);
    return signedToken.toString();
  }
}

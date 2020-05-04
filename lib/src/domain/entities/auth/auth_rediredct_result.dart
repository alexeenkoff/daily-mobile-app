class AuthRedirectResult {
  final String provider;
  final String providerCode;
  final double exp;
  final String codeChallenge;
  final int iat;
  final String aud;
  final String iss;

  AuthRedirectResult(this.provider, this.providerCode, this.exp,
      this.codeChallenge, this.iat, this.aud, this.iss);
}
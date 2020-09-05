import 'package:daily_mobile_app/src/api/model/auth_response.dart';
import 'package:daily_mobile_app/src/domain/entities/auth/auth_rediredct_result.dart';
import 'package:daily_mobile_app/src/domain/entities/auth/code_challenge.dart';

abstract class AuthRepository {
  AuthRedirect parseRedirectUrl(String url);

  CodeChallenge generateChallenge();

  Future<AuthResponse> authenticate(String verifier, AuthRedirect redirect);
}

enum Provider { github, google }

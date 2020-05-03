import 'package:daily_mobile_app/src/domain/entities/auth_rediredct_result.dart';
import 'package:daily_mobile_app/src/domain/entities/code_challenge.dart';

abstract class AuthRepository {
  AuthRedirectResult parseRedirectUrl(String url);

  CodeChallenge generateChallenge();
}

enum Provider { github, google }

import 'package:daily_mobile_app/src/domain/entities/auth_rediredct_result.dart';

abstract class AuthRepository {
  AuthRedirectResult parseRedirectUrl(String url);
}

enum Provider { github, google }

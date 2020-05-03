
import 'package:daily_mobile_app/src/data/repository/auth/auth_rep_impl.dart';
import 'package:daily_mobile_app/src/data/repository/auth/redirect_url_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main (){
  test('create codeChallenge', (){
    final authRepositoryImpl = AuthRepositoryImpl(GitHubUrlParser());
    final resllt = authRepositoryImpl.generateChallenge();
    final x = 0;
  });
}
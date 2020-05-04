import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

import 'package:daily_mobile_app/src/data/repository/auth/redirect_url_parser.dart';
import 'package:daily_mobile_app/src/domain/entities/auth/auth_rediredct_result.dart';
import 'package:daily_mobile_app/src/domain/entities/auth/code_challenge.dart';
import 'package:daily_mobile_app/src/domain/interfaces/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RedirectUrlParser _redirectUrlParser;

  AuthRepositoryImpl(this._redirectUrlParser);

  @override
  AuthRedirectResult parseRedirectUrl(String url) {
    return _redirectUrlParser.parseUrl(url);
  }

  @override
  CodeChallenge generateChallenge() {
    final random = Random.secure();
    final list = Uint32List(32);
    for (int x = 0; x < list.length; x++) {
      list[x] = random.nextInt(1000000000);
    }
    final verifier = List.generate(list.length, (index) {
      var radixString = '0' + list[index].toRadixString(16);
      var substring = radixString.substring(radixString.length - 2);
      return substring;
    }).join('');
    final data = utf8.encode(verifier);
    final hashed = sha256.convert(data).bytes;
    final uInt8list = Uint8List.fromList(hashed);
    final buffer = StringBuffer();
    buffer
        .writeAll(uInt8list.map((item) => String.fromCharCode(item)).toList());
    final needEBtoa = buffer.toString();
    final challenge = base64
        .encode(utf8.encode(needEBtoa))
        .replaceAll('+', '-')
        .replaceAll('/', '_')
        .replaceAll('=', '');
    return CodeChallenge(verifier, challenge);
  }
}

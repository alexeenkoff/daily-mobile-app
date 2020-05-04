import 'package:daily_mobile_app/src/api/model/auth_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

void main() {
  test('auth response map', () {
    final _json =
        '{"id":"214099df9a8a4bd2bdcd39862fa7ee22","name":"alexeenkoff","email":"alexeenkoff@gmail.com","image":"https://avatars0.githubusercontent.com/u/10181877?v=4","providers":["github","google"],"newUser":false}';
    final map = json.decode(_json);
    final result = AuthResponse.fromJson(map);
    assert(result.id == '214099df9a8a4bd2bdcd39862fa7ee22');
    assert(result.name == 'alexeenkoff');
    assert(result.email == 'alexeenkoff@gmail.com');
    assert(result.image ==
        'https://avatars0.githubusercontent.com/u/10181877?v=4');
    assert(result.providers.length == 2);
    assert(result.providers[0] == 'github');
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:daily_mobile_app/src/common/collection_extension.dart';

void main() {
  test('check mapToList fun', () {
    final strings = ['0', '1', '2'];
    final ints = strings.mapToList((s) => int.parse(s));
    assert(ints.length == 3);
    assert(ints[0] == 0);
    assert(ints[1] == 1);
    assert(ints[2] == 2);
  });
}

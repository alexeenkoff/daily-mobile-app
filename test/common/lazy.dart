import 'package:daily_mobile_app/src/common/lazy.dart';
import 'package:flutter_test/flutter_test.dart';

class TestLazy {
  final int integerValue;
  final String stringValue;

  TestLazy(this.integerValue, this.stringValue);
}

void main() {
  test('lazy init', () {
    final result = Lazy(() => TestLazy(15, "result"));
    assert(result.value().integerValue == 15);
    assert(result.value().stringValue == 'result');
  });
}

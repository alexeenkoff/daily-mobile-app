typedef InitLazy<T> = T Function();

class Lazy<T> {
  final InitLazy _initFun;
  T _result;

  Lazy(this._initFun);

  T value() {
    if (_result == null) {
      _result = _initFun();
    }
    return _result;
  }
}

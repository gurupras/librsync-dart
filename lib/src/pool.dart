import 'dart:collection';

class Pool<T> {
  final Queue<T> _pool;
  final T Function() _create;

  Pool(this._create) : _pool = Queue<T>();

  T acquire() {
    if (_pool.isNotEmpty) {
      return _pool.removeFirst();
    }
    return _create();
  }

  void release(T object) {
    _pool.add(object);
  }
}

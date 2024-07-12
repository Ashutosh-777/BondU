import 'dart:async';

extension DebounceExtension<T> on Function {
  Function debounce(Duration duration) {
    Timer? timer;

    if (this is Function(T)) {
      return (T value) {
        timer?.cancel();
        timer = Timer(duration, () {
          (this as Function(T))(value);
        });
      };
    } else if (this is Function()) {
      return () {
        timer?.cancel();
        timer = Timer(duration, () {
          (this as Function())();
        });
      };
    } else {
      throw ArgumentError('Unsupported function type');
    }
  }
}

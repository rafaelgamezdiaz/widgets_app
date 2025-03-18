import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

int _initialCounter = 5;

@riverpod
class Counter extends _$Counter {
  @override
  int build() => _initialCounter;

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void reset() {
    state = _initialCounter;
  }
}

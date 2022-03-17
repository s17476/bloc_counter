import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/logic/cubit/internet_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('The initial state for the CounterState(counterValue:0)', () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
      'The cubit should emit a CounterState(conterValue:1, wasIncremented:true) when cubit.increment() function is called',
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );
  });
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test/constants/enum.dart';
import 'package:test/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;
  CounterCubit({required this.internetCubit})
      : super(CounterState(counter: 0, didIncrement: false)) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState>? monitorInternetCubit() {
    internetStreamSubscription = internetCubit.stream.listen((event) {
      if (event is InternetConnected &&
          event.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (event is InternetConnected &&
          event.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void increment() =>
      emit(CounterState(counter: state.counter + 1, didIncrement: true));

  void decrement() =>
      emit(CounterState(counter: state.counter - 1, didIncrement: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}

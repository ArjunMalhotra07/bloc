import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test/constants/enum.dart';
import 'package:test/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0, didIncrement: false));

  void increment() =>
      emit(CounterState(counter: state.counter + 1, didIncrement: true));

  void decrement() =>
      emit(CounterState(counter: state.counter - 1, didIncrement: false));
}

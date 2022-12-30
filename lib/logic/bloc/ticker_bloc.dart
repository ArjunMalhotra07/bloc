import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ticker_event.dart';
part 'ticker_state.dart';

class TickerBloc extends Bloc<TickerEvent, TickerState> {
  TickerBloc() : super(TickerInitial()) {
    on<TickerEvent>((event, emit) {
      TickerInitial();
    });

    on<AddEvent>(((event, emit) {
      emit(
          TickerAddState(num: event.num + 2, didAdd: true, didSubtract: false));
    }));
    on<SubtractEvent>(((event, emit) {
      emit(TickerSubtractState(
          num: event.num - 2, didSubtract: true, didAdd: false));
    }));
  }
}

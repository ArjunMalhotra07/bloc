import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ticker_event.dart';
part 'ticker_state.dart';

class TickerBloc extends Bloc<TickerEvent, TickerState> {
  TickerBloc() : super(TickerInitial()) {
    on<TickerEvent>((event, emit) {});
  }
}

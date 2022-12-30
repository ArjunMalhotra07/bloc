part of 'ticker_bloc.dart';

abstract class TickerState extends Equatable {
  const TickerState();

  @override
  List<Object> get props => [];
}

class TickerInitial extends TickerState {
  @override
  List<Object> get props => [];
}

class TickerAdd extends TickerState {
  final int num;

  const TickerAdd({required this.num});
}

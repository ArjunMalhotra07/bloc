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

class TickerAddState extends TickerState {
  final int num;
  final bool didAdd;
  final bool didSubtract;
  const TickerAddState(
      {required this.num, required this.didAdd, required this.didSubtract});
  @override
  List<Object> get props => [num];
}

class TickerSubtractState extends TickerState {
  final int num;
  final bool didSubtract;
  final bool didAdd;
  const TickerSubtractState(
      {required this.num, required this.didSubtract, required this.didAdd});
  @override
  List<Object> get props => [num];
}

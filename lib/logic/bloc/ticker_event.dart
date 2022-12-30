part of 'ticker_bloc.dart';

abstract class TickerEvent extends Equatable {
  const TickerEvent();

  @override
  List<Object> get props => [];
}

class AddEvent extends TickerEvent {
  final int num;
  final bool didAdd;
  final bool didSubtract;
  const AddEvent(this.num, this.didAdd, this.didSubtract);
  @override
  List<Object> get props => [num, didAdd, didSubtract];
}

class SubtractEvent extends TickerEvent {
  final int num;
  final bool didSubtract;
  final bool didAdd;
  const SubtractEvent(this.num, this.didSubtract, this.didAdd);
  @override
  List<Object> get props => [num, didAdd, didSubtract];
}

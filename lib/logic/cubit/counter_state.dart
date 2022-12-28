part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  final bool didIncrement;

  CounterState({required this.counter, required this.didIncrement});

  @override
  List<Object?> get props => [this.counter, this.didIncrement];
}

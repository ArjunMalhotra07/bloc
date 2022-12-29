import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test/constants/enum.dart';

part 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit()
      : super(const StatusState(status: Status.Away, isActive: false));

  void setStatusActive() =>
      emit(const StatusState(status: Status.Active, isActive: true));
  void setStatusAway() =>
      emit(const StatusState(status: Status.Away, isActive: false));
}

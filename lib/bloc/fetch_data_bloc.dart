import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_data_event.dart';
part 'fetch_data_state.dart';

class FetchDataBloc extends Bloc<FetchDataEvent, FetchDataState> {
  FetchDataBloc() : super(FetchDataInitial()) {
    on<FetchDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

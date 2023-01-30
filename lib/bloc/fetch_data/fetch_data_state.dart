part of 'fetch_data_bloc.dart';

class FetchDataState extends Equatable {
  const FetchDataState();

  @override
  List<Object> get props => [];
}

class FetchDataInitial extends FetchDataState {}

class FetchingDataState extends FetchDataState {
  const FetchingDataState();

  @override
  List<Object> get props => [];
}

class DataLoadedState extends FetchDataState {
  List<ApiModel> data;
  DataLoadedState({required this.data});

  @override
  List<Object> get props => [data];
}

class ErrorOccuredWhileFetchingData extends FetchDataState {
  const ErrorOccuredWhileFetchingData();
  @override
  List<Object> get props => [];
}

class InternetNotConnectedState extends FetchDataState {
  const InternetNotConnectedState();
  @override
  List<Object> get props => [];
}
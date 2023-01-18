part of 'fetch_data_bloc.dart';

abstract class FetchDataState extends Equatable {
  const FetchDataState();
  
  @override
  List<Object> get props => [];
}

class FetchDataInitial extends FetchDataState {}

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;
import 'package:test/logic/models/get_api_model.dart';
part 'fetch_data_event.dart';
part 'fetch_data_state.dart';

class FetchDataBloc extends Bloc<FetchDataEvent, FetchDataState> {
  FetchDataBloc() : super(FetchDataInitial()) {
    on<FetchDataEvent>((event, emit) async {
      emit(const FetchingDataState());
      final rawJson = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      final parsedJson = json.decode(rawJson.body) as List<dynamic>;
      final incomingDataList =
          parsedJson.map((json) => ApiModel.fromJson(json)).toList();

      emit(DataLoadedState(data: incomingDataList));
    });
  }
}

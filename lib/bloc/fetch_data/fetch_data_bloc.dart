import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;
import 'package:test/logic/models/get_api_model.dart';
part 'fetch_data_event.dart';
part 'fetch_data_state.dart';

class FetchDataBloc extends Bloc<FetchDataEvent, FetchDataState> {
  FetchDataBloc() : super(FetchDataInitial()) {
    on<FetchDataEvent>((event, emit) async {
      try {
        final rawJson = await http
            .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
        if (rawJson.statusCode == 200) {
          final parsedJson = json.decode(rawJson.body) as List<dynamic>;

          final incomingDataList =
              parsedJson.map((json) => ApiModel.fromJson(json)).toList();
          emit(DataLoadedState(data: incomingDataList));
        } else {
          emit(const ErrorOccuredWhileFetchingData());
        }
      } catch (e) {
        emit(const ErrorOccuredWhileFetchingData());
      }
    });
  }
}

// class NetworkHelper {
//   static void observeNetwork() {
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       if (result == ConnectivityResult.none) {
//         NetworkBloc().add(NetworkNotify());
//       } else {
//         NetworkBloc().add(NetworkNotify(isConnected: true));
//       }
//     });
//   }
// }

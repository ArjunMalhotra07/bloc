import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/constants/enum.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;
  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult>? monitorInternetConnection() {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        emit(const InternetConnected(connectionType: ConnectionType.Mobile));
      } else if (event == ConnectivityResult.wifi) {
        emit(const InternetConnected(connectionType: ConnectionType.Wifi));
      } else if (event == ConnectivityResult.none) {
        emit(InternetDisconnected());
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisonnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus { connected, disconnected }

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();

  Future<void> initialize() async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    _updateConnectionStatus(connectivityResult);
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    bool isConnected = connectivityResult != ConnectivityResult.none;
    connectionStatusController.add(
      isConnected
          ? ConnectivityStatus.connected
          : ConnectivityStatus.disconnected,
    );
  }

  void dispose() {
    connectionStatusController.close();
  }
}

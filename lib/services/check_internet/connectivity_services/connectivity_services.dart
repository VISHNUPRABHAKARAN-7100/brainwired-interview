import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus { connected, disconnected }

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();

  Future<void> initialize() async {
    // Check current connectivity status when initializing.
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    _updateConnectionStatus(connectivityResult);
    // Listen to connectivity changes and update status accordingly.
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    // Determine if the device is connected or disconnected.
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

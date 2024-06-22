import 'package:brainwired_interview/splash/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'services/check_internet/connectivity_services/connectivity_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // The below code is for lock the application to portrait up and portrait down
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Object of the internet checker.
  final ConnectivityService _connectivityService = ConnectivityService();

  @override
  Widget build(BuildContext context) {
    _connectivityService.initialize();
    return MultiProvider(
      providers: [
        // Declaring the Stream provider for the internet checker.
        StreamProvider<ConnectivityStatus>.value(
          value: _connectivityService.connectionStatusController.stream,
          initialData: ConnectivityStatus.disconnected,
        ),
      ],
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(1),
        ),
        child: const MaterialApp(
          home: Splash(),
        ),
      ),
    );
  }
}

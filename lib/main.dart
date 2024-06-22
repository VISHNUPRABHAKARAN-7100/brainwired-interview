import 'package:brainwired_interview/home/provider/home_provider.dart';
import 'package:brainwired_interview/splash_screen/view/splash_screen..dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'services/check_internet/connectivity_services/connectivity_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure the app remains in portrait mode, supporting only upright and upside-down orientations.
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
    // Initialize connectivity service to monitor internet status throughout the app.
    _connectivityService.initialize();

    return MultiProvider(
      providers: [
        // - StreamProvider for real-time connectivity status updates.
        StreamProvider<ConnectivityStatus>.value(
          value: _connectivityService.connectionStatusController.stream,
          initialData: ConnectivityStatus.disconnected,
        ),
        // - ChangeNotifierProvider for managing state in the HomeProvider.
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(1),
        ),
        child: const MaterialApp(
          home: SplashScreen(),
        ),
      ),
    );
  }
}

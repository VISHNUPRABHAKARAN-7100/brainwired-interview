import 'package:brainwired_interview/splash_screen/events/splash_screen_events.dart';
import 'package:flutter/material.dart';
import 'package:brainwired_interview/utils/image_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    SplashEvents.navigateToHome(context: context);
  }

  @override
  Widget build(BuildContext context) {
    // Retrieves the size of the device screen.
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            ImagePaths.logoPath,
            height: screenHeight / 1.5,
            width: screenWidth / 1.5,
          ),
        ),
      ),
    );
  }
}

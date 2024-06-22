import 'package:brainwired_interview/splash/events/splash_events.dart';
import 'package:flutter/material.dart';
import 'package:brainwired_interview/utils/image_paths.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SplashEvents.navigateToHome(context: context);
  }

  @override
  Widget build(BuildContext context) {
    // Get the size of the device screen.
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            ImagePaths.logo,
            height: screenHeight / 1.5,
            width: screenWidth / 1.5,
          ),
        ),
      ),
    );
  }
}

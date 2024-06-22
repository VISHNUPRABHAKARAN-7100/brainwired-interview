import 'package:flutter/material.dart';
import 'package:brainwired_interview/utils/image_paths.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

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

import 'dart:async';
import 'package:flutter/material.dart';
import '../../home/view/home.dart';

class SplashEvents {
  static void navigateToHome({required BuildContext context}) {
    // Delays navigation to the home screen by 3 seconds.
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      },
    );
  }
}

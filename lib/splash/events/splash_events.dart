import 'dart:async';
import 'package:flutter/material.dart';
import '../../home/view/home.dart';

class SplashEvents {
  static void navigateToHome({required BuildContext context}) {
    Timer(
      const Duration(seconds: 1),
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

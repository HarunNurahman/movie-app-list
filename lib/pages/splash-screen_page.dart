import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/dashboard'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/icon.png',
              width: 128,
              color: whiteColor,
            ),
            SizedBox(height: defaultMargin),
            CircularProgressIndicator(color: whiteColor)
          ],
        ),
      ),
    );
  }
}

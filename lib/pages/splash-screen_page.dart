import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';
import 'package:movieapp_javan_devtest/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<MovieProvider>(context, listen: false).getNowPlaying();
    await Provider.of<MovieProvider>(context, listen: false).getTopRated();

    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context)
          .pushNamedAndRemoveUntil('/dashboard', (route) => true),
    );
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

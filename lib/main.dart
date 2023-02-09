import 'package:flutter/material.dart';
import 'package:movieapp_javan_devtest/pages/dashboard_page.dart';
import 'package:movieapp_javan_devtest/pages/now-playing_page.dart';
import 'package:movieapp_javan_devtest/pages/popular-movie_page.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const DashboardPage(),
        '/now-playing': (context) => const NowPlaying(),
        '/popular': (context) => const PopularMoviePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

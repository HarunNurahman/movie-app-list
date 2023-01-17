import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_javan_devtest/pages/dashboard_page.dart';
import 'package:movieapp_javan_devtest/pages/detail-movie_page.dart';

void main() => runApp(const MyApp());

// // Device Preview // //
// void main() => runApp(DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => MyApp(),
//     ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const DashboardPage(),
        '/detail-movie': (context) => DetailMoviePage(),
      },
      debugShowCheckedModeBanner: false,
      // // Device Preview // //
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
    );
  }
}

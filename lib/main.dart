import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_list/core/utils/style.dart';
import 'package:movie_app_list/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:movie_app_list/presentation/pages/splash/splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DashboardBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kprimaryColor,
          appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: true,
            
            backgroundColor: kprimaryColor,
            iconTheme: IconThemeData(color: whiteColor),
            titleTextStyle: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}

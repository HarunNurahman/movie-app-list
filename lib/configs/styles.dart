import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';

// // Color List
Color transparent = Colors.transparent;
Color blackColor = const Color(0xFF000000);
Color whiteColor = const Color(0xFFFFFFFF);

Color grayColor = const Color(0xFF9C9C9C);
Color gray2Color = const Color(0xFFAAA9B1);
Color gray3Color = const Color(0xFFE5E4EA);
Color gray4Color = const Color(0xFFDBE3FF);

Color blueColor = const Color(0xFF110E47);
Color lightBlueColor = const Color(0xFF88A4E8);

Color redColor = const Color(0xFFFF2E2E);
Color yellowColor = const Color(0xFFFFC319);

// // Text Style List w/ Fonts
TextStyle blackTextStyle = GoogleFonts.mulish(color: blackColor);
TextStyle whiteTextStyle = GoogleFonts.mulish(color: whiteColor);
TextStyle grayTextStyle = GoogleFonts.mulish(color: grayColor);

TextStyle primaryTextStyle = GoogleFonts.mulish(color: blueColor);
TextStyle subtitleTextStyle = GoogleFonts.mulish(color: grayColor);
TextStyle lightBlueTextStyle = GoogleFonts.mulish(color: lightBlueColor);

// Font Weight List
FontWeight light = FontWeight.w300;
FontWeight normal = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

// Default Margin & Radius List
double defaultMargin = 24.0;
double defaultRadius = 12.0;

// App Format (Currency Format & Date Time Format)
class AppFormat {
  // Currency
  static String currencyFormat(String number) {
    return NumberFormat.currency(
      locale: 'id_ID',
      decimalDigits: 0,
      symbol: '\$ ',
    ).format(double.parse(number));
  }

  // // Date Format
  // static String dateFormat(String stringDate) {
  //   DateTime dateTime = DateTime.parse(stringDate);
  //   return DateFormat('dd MMMM yyyy', 'id_ID').format(dateTime);
  // }
}

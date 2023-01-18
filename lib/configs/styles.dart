import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

// Color List
Color blackColor = const Color(0xFF000000);
Color whiteColor = const Color(0xFFFFFFFF);
Color grayColor = const Color(0xFFC2C2C2);
Color transparent = Colors.transparent;

// Text Style List w/ Fonts
TextStyle blackTextStyle = GoogleFonts.poppins(color: blackColor);
TextStyle whiteTextStyle = GoogleFonts.poppins(color: whiteColor);
TextStyle grayTextStyle = GoogleFonts.poppins(color: grayColor);

// Font Weight List
FontWeight light = FontWeight.w300;
FontWeight normal = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

// Default Margin & Radius List
double defaultMargin = 30.0;
double defaultRadius = 12.0;

// App Format (Currency Format & Date Time Format)
// class AppFormat {
//   // Currency
//   static String currencyFormat(String number) {
//     return NumberFormat.currency(
//       locale: 'id_ID',
//       decimalDigits: 0,
//       symbol: 'USD ',
//     ).format(double.parse(number));
//   }

//   // Date Format
//   static String dateFormat(String stringDate) {
//     DateTime dateTime = DateTime.parse(stringDate);
//     return DateFormat('dd MMMM yyyy', 'id_ID').format(dateTime);
//   }
// }

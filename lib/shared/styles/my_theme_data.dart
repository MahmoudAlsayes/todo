import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/shared/styles/colors.dart';

class MyThemeData {

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: mint,


    // textTheme: TextTheme(
    //   bodySmall: GoogleFonts.elMessiri(
    //     fontSize: 20,
    //     fontWeight: FontWeight.w400,
    //     color: blackColor,
    //   ),
    //   bodyMedium: GoogleFonts.elMessiri(
    //     fontSize: 12,
    //     fontWeight: FontWeight.w700,
    //     color: blackColor,
    //   ),
    //   bodyLarge: GoogleFonts.elMessiri(
    //     fontSize: 30,
    //     fontWeight: FontWeight.bold,
    //     color: blackColor,
    //   ),
    // ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,

    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: DarkBackGround,


    // textTheme: TextTheme(
    //   bodySmall: GoogleFonts.elMessiri(
    //     fontSize: 20,
    //     fontWeight: FontWeight.w400,
    //     color: blackColor,
    //   ),
    //   bodyMedium: GoogleFonts.elMessiri(
    //     fontSize: 12,
    //     fontWeight: FontWeight.w700,
    //     color: blackColor,
    //   ),
    //   bodyLarge: GoogleFonts.elMessiri(
    //     fontSize: 30,
    //     fontWeight: FontWeight.bold,
    //     color: blackColor,
    //   ),
    // ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff141922),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,

    ),
  );




}

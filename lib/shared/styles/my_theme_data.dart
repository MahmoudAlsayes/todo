import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/shared/styles/colors.dart';

class MyThemeData {

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor:mint,

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
  static ThemeData darkTheme = ThemeData();
// ThemeData(
  //   scaffoldBackgroundColor: Colors.transparent,
  //   colorScheme: ColorScheme(
  //       brightness: Brightness.dark,
  //       primary: darkPrimarty,
  //       onPrimary: Colors.white,
  //       secondary: yellow,
  //       onSecondary: Colors.white,
  //       error: Colors.red,
  //       onError: Colors.white,
  //       background: yellow,
  //       onBackground: Colors.white,
  //       surface: darkPrimarty,
  //       onSurface: Colors.white),
  //   textTheme: TextTheme(
  //     bodySmall: GoogleFonts.elMessiri(
  //       fontSize: 20,
  //       fontWeight: FontWeight.w400,
  //       color: const Color(0xffFACC1D),
  //     ),
  //     bodyMedium: GoogleFonts.elMessiri(
  //       fontSize: 25,
  //       fontWeight: FontWeight.w700,
  //       color: const Color(0xffFACC1D),
  //     ),
  //     bodyLarge: GoogleFonts.elMessiri(
  //       fontSize: 30,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //     ),
  //   ),
  //   appBarTheme: const AppBarTheme(
  //     iconTheme: IconThemeData(color: Colors.white, size: 30),
  //     color: Colors.transparent,
  //     elevation: 0.0,
  //     centerTitle: true,
  //   ),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     type: BottomNavigationBarType.shifting,
  //     selectedItemColor: yellow,
  //     unselectedItemColor: Colors.white,
  //     backgroundColor: darkPrimarty,
  //   ),
  // );
}

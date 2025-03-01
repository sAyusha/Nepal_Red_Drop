import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // light theme
  static getApplicationTheme(BuildContext context) {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Colors.black,
      ),
      
      fontFamily: GoogleFonts.poppins().fontFamily,
      useMaterial3: true,

      // scaffoldBackgroundColor: AppColorConstant.mainSecondaryColor,

      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: MediaQuery.of(context).size.shortestSide >= 600
            ? TextStyle(
                fontSize: 40,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: 1.5,
              )
            : TextStyle(
                fontSize: 28,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: 1.5,
              ),
      ),

      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: AppColorConstant.primaryAccentColor,
      //   selectedItemColor: const Color.fromARGB(255, 250, 196, 196),
      //   unselectedItemColor: AppColorConstant.whiteTextColor,
      //   showSelectedLabels: false, // Hide the labels
      //   showUnselectedLabels: false, // Hide the labels
      // ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),

      // iconButtonTheme: IconButtonThemeData(
      //     style: IconButton.styleFrom(
      //         foregroundColor: AppColorConstant.primaryAccentColor)),

      // datePickerTheme: DatePickerThemeData(

      // )

    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Mytheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Mytheme.creamColor,
      secondaryHeaderColor: Mytheme.darkbluisColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Mytheme.darkbluisColor,
          iconColor: Mytheme.creamColor
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ));

  static ThemeData DarkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.lato().fontFamily,
      cardColor: Colors.black,
      canvasColor: Mytheme.dartcreamColor,
      secondaryHeaderColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Mytheme.darkbluisColor,
              iconColor: Mytheme.creamColor)),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ));

// Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color dartcreamColor = Vx.gray900;
  static Color darkbluisColor = const Color(0xff403b58);
  static Color lightbluisColor = Vx.indigo500;
}

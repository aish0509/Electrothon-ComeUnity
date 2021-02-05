import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurTheme {
  ThemeData buildTheme() {
    return ThemeData(
     primaryColor: Styles.COFFEE,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          fontSize: 17.0,
        ),
        enabledBorder: UnderlineInputBorder(
          // borderRadius: BorderRadius.circular(35.0),
          borderSide: BorderSide(color: Styles.DARK_TAN, width: 3.0),
        ),
        focusedBorder: UnderlineInputBorder(
          // borderRadius: BorderRadius.circular(35.0),
          borderSide: BorderSide(color: Styles.DARK_GRAYBROWN, width: 2.0),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Styles.DARK_TAN,
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 15.0),
        minWidth: 140,
        height: 40.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}

abstract class Styles {
  static const Color WHITE = Colors.white;
  static const Color CREAM = Color(0xfff0e8d3);
  static const Color PRIMARY_CREAM = Color(0xfffaf4e8);
  static const Color TAN = Color(0xffd2a17c);
  static const Color DARK_TAN = Color(0xffbc997e);
  static const Color COFFEE = Color(0xffc3a894);
  static const Color GRAY_BROWN = Color(0xffac9e93);
  static const Color DARK_GRAYBROWN = Color(0xff898079);
}

class AppIcons {
  AppIcons._();

  static const _kFontFam = 'AppIcons';
  static const String _kFontPkg = null;

  static const IconData twitter =
      IconData(0xf099, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData facebook =
      IconData(0xf09a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData github_circled =
      IconData(0xf09b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData linkedin =
      IconData(0xf0e1, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

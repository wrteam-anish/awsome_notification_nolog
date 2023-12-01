import 'package:flutter/material.dart';

import '../main_complete.dart';

enum Themes { light, dark }

class ThemesController {
  static final appThemeData = {
    Themes.light: ThemeData(
      brightness: Brightness.light,

      primaryColor: App.mainColor,
      // ignore: deprecated_member_use
      colorScheme: const ColorScheme.light().copyWith(
        secondary: Colors.blueGrey,
      ),
      canvasColor: Colors.white,
      focusColor: Colors.blueAccent,
      disabledColor: Colors.grey,

      backgroundColor: Colors.blueGrey.shade400,

      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: App.mainColor,
          )
      ),

      fontFamily: 'Robot',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        headline1:
            TextStyle(fontSize: 64.0, height: 1.5, fontWeight: FontWeight.w500),
        headline2:
            TextStyle(fontSize: 52.0, height: 1.5, fontWeight: FontWeight.w500),
        headline3:
            TextStyle(fontSize: 48.0, height: 1.5, fontWeight: FontWeight.w500),
        headline4:
            TextStyle(fontSize: 32.0, height: 1.5, fontWeight: FontWeight.w500),
        headline5:
            TextStyle(fontSize: 28.0, height: 1.5, fontWeight: FontWeight.w500),
        headline6:
            TextStyle(fontSize: 22.0, height: 1.5, fontWeight: FontWeight.w500),
        subtitle1:
            TextStyle(fontSize: 18.0, height: 1.5, color: Colors.black54),
        subtitle2:
            TextStyle(fontSize: 12.0, height: 1.5, color: Colors.black54),
        button: TextStyle(fontSize: 16.0, height: 1.5, color: Colors.black54),
        bodyText1: TextStyle(fontSize: 16.0, height: 1.5),
        bodyText2: TextStyle(fontSize: 16.0, height: 1.5),
      ),

      buttonTheme: ButtonThemeData(
        buttonColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        textTheme: ButtonTextTheme.accent,
      ),
    )
  };

  static ThemeData? _currentTheme;

  ThemesController(bool isLight) {
    _currentTheme = appThemeData[isLight ? Themes.light : Themes.dark]!;
  }

  /// Use this method on UI to get selected theme.
  static ThemeData get currentTheme {
    _currentTheme ??= appThemeData[Themes.light];
    return _currentTheme!;
  }

  /// Sets theme and notifies listeners about change.
  setTheme(Themes theme) async {
    _currentTheme = appThemeData[theme];

    // Here we notify listeners that theme changed
    // so UI have to be rebuild
    // notifyListeners();
  }
}

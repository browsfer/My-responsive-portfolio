import 'package:flutter/material.dart';

// LIGHT THEME
ThemeData lightTheme = ThemeData(
    fontFamily: 'OpenSans',
    useMaterial3: true,
    brightness: Brightness.light,

    //Colors scheme
    colorScheme: ColorScheme.light(
      primary: Colors.teal[200]!,
      background: Colors.white,
      secondary: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[800],
      foregroundColor: Colors.white,
    ));

//DARK THEME
ThemeData darkTheme = ThemeData(
    fontFamily: 'OpenSans',
    useMaterial3: true,
    brightness: Brightness.dark,

    //Colors scheme
    colorScheme: ColorScheme.dark(
      primary: Colors.teal[800]!,
      background: Colors.grey[800]!,
      secondary: Colors.grey[500]!,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF212121),
    ));

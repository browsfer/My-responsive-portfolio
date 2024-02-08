import 'package:flutter/material.dart';

// LIGHT THEME
ThemeData lightTheme = ThemeData(
  fontFamily: 'Montserrat',
  useMaterial3: true,
  brightness: Brightness.light,

  //Colors scheme
  colorScheme: const ColorScheme.light(
    primary: Color(0xff3c6939),
    surfaceTint: Color(0xff3c6939),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffbdf0b4),
    onPrimaryContainer: Color(0xff002203),
    secondary: Color(0xff53634f),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffd6e8ce),
    onSecondaryContainer: Color(0xff111f0f),
    tertiary: Color(0xff38656a),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffbcebf0),
    onTertiaryContainer: Color(0xff002023),
    error: Color(0xffba1a1a),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff410002),
    background: Color.fromARGB(255, 232, 241, 220),
    onBackground: Color(0xff191d17),
    surface: Color(0xfff7fbf1),
    onSurface: Color(0xff191d17),
  ),

  //App bar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 180, 209, 167),
    foregroundColor: Color(0xff111f0f),
  ),

  //Text Theme
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18),
  ),
);

//DARK THEME
ThemeData darkTheme = ThemeData(
  fontFamily: 'Montserrat',
  useMaterial3: true,
  brightness: Brightness.dark,

  //Colors scheme
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Color(0xffa1d399),
    surfaceTint: Color(0xffa1d399),
    onPrimary: Color(0xff0b390f),
    primaryContainer: Color(0xff245023),
    onPrimaryContainer: Color(0xffbdf0b4),
    secondary: Color(0xffbaccb3),
    onSecondary: Color(0xff253423),
    secondaryContainer: Color(0xff3b4b38),
    onSecondaryContainer: Color(0xffd6e8ce),
    tertiary: Color(0xffa0cfd4),
    onTertiary: Color(0xff00363b),
    tertiaryContainer: Color(0xff1e4d52),
    onTertiaryContainer: Color(0xffbcebf0),
    error: Color(0xffffb4ab),
    onError: Color(0xff690005),
    errorContainer: Color(0xff93000a),
    onErrorContainer: Color(0xffffdad6),
    background: Color(0xff10140f),
    onBackground: Color(0xffe0e4db),
    surface: Color(0xff10140f),
    onSurface: Color(0xffe0e4db),
    surfaceVariant: Color(0xff424940),
  ),

  //App bar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff253423),
    foregroundColor: Color(0xffd6e8ce),
  ),

  //Text Theme
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18),
  ),
);

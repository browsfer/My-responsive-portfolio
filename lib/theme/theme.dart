import 'package:flutter/material.dart';

// LIGHT THEME
ThemeData lightTheme = ThemeData(
  fontFamily: 'OpenSans',
  useMaterial3: true,
  brightness: Brightness.light,

  //Colors scheme
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primary: Color(4281363010),
    surfaceTint: Color(4281363010),
    onPrimary: Color(4294967295),
    primaryContainer: Color(4289982911),
    onPrimaryContainer: Color(4278198541),
    secondary: Color(4283458387),
    onSecondary: Color(4294967295),
    secondaryContainer: Color(4292012243),
    onSecondaryContainer: Color(4279050002),
    tertiary: Color(4282017134),
    onTertiary: Color(4294967295),
    tertiaryContainer: Color(4290702070),
    onTertiaryContainer: Color(4278198053),
    error: Color(4290386458),
    onError: Color(4294967295),
    errorContainer: Color(4294957782),
    onErrorContainer: Color(4282449922),
    background: Color(4294376435),
    onBackground: Color(4279770392),
    surface: Color(4294376435),
    onSurface: Color(4279770392),
    surfaceVariant: Color(4292732378),
    onSurfaceVariant: Color(4282468673),
    outline: Color(4285626737),
    outlineVariant: Color(4290890175),
    shadow: Color(4278190080),
    scrim: Color(4278190080),
    inverseSurface: Color(4281152045),
    inversePrimary: Color(4288140709),
  ),

  //Text Theme
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18),
  ),
);

//DARK THEME
ThemeData darkTheme = ThemeData(
  fontFamily: 'OpenSans',
  useMaterial3: true,
  brightness: Brightness.dark,

  //Colors scheme
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Color(4288140709),
    surfaceTint: Color(4288140709),
    onPrimary: Color(4278204698),
    primaryContainer: Color(4279587116),
    onPrimaryContainer: Color(4289982911),
    secondary: Color(4290170040),
    onSecondary: Color(4280431910),
    secondaryContainer: Color(4281879356),
    onSecondaryContainer: Color(4292012243),
    tertiary: Color(4288859865),
    onTertiary: Color(4278269503),
    tertiaryContainer: Color(4280307030),
    onTertiaryContainer: Color(4290702070),
    error: Color(4294948011),
    onError: Color(4285071365),
    errorContainer: Color(4287823882),
    onErrorContainer: Color(4294957782),
    background: Color(4279244048),
    onBackground: Color(4292863196),
    surface: Color(4279244048),
    onSurface: Color(4292863196),
    surfaceVariant: Color(4282468673),
    onSurfaceVariant: Color(4290890175),
    outline: Color(4287337354),
    outlineVariant: Color(4282468673),
    shadow: Color(4278190080),
    scrim: Color(4278190080),
    inverseSurface: Color(4292863196),
    inversePrimary: Color(4281363010),
  ),

  //Text Theme
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18),
  ),
);

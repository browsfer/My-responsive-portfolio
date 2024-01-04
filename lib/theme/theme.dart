import 'package:flutter/material.dart';

// LIGHT THEME
ThemeData lightTheme = ThemeData(
  fontFamily: 'OpenSans',
  useMaterial3: true,
  brightness: Brightness.light,

  //Colors scheme
  colorScheme: const ColorScheme.light(
    primary: Color(4282149177),
    surfaceTint: Color(4282149177),
    onPrimary: Color(4294967295),
    primaryContainer: Color(4290638004),
    onPrimaryContainer: Color(4278198787),
    secondary: Color(4283654991),
    onSecondary: Color(4294967295),
    secondaryContainer: Color(4292274382),
    onSecondaryContainer: Color(4279312143),
    tertiary: Color(4281886058),
    onTertiary: Color(4294967295),
    tertiaryContainer: Color(4290571248),
    onTertiaryContainer: Color(4278198307),
    error: Color(4290386458),
    onError: Color(4294967295),
    errorContainer: Color(4294957782),
    onErrorContainer: Color(4282449922),
    background: Color.fromARGB(255, 232, 241, 220),
    onBackground: Color(4279835927),
    surface: Color(4294441969),
    onSurface: Color(4279835927),
  ),

  //App bar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 180, 209, 167),
    foregroundColor: Color(4279312143),
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
    primary: Color(4288795545),
    surfaceTint: Color(4288795545),
    onPrimary: Color(4278925583),
    primaryContainer: Color(4280569891),
    onPrimaryContainer: Color(4290638004),
    secondary: Color(4290432179),
    onSecondary: Color(4280628259),
    secondaryContainer: Color(4282075960),
    onSecondaryContainer: Color(4292274382),
    tertiary: Color(4288729044),
    onTertiary: Color(4278203963),
    tertiaryContainer: Color(4280175954),
    onTertiaryContainer: Color(4290571248),
    error: Color(4294948011),
    onError: Color(4285071365),
    errorContainer: Color(4287823882),
    onErrorContainer: Color(4294957782),
    background: Color(4279243791),
    onBackground: Color(4292928731),
    surface: Color(4279243791),
    onSurface: Color(4292928731),
    surfaceVariant: Color(4282534208),
  ),

  //App bar theme
  appBarTheme: AppBarTheme(
    backgroundColor: Color(4280628259),
    foregroundColor: Color(4292274382),
  ),

  //Text Theme
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18),
  ),
);

import 'package:flutter/material.dart';

var avatarFadeInDuration = const Duration(milliseconds: 350);

//WEATHER API KEY
String weatherApiKey = '3c358157b3ef6a4c54ec50c0b6e9e0a1';

//TOGGLE THEME BUTTON CONSTANTS
bool isLightTheme = true;
Icon lightIcon = const Icon(
  Icons.light_mode_sharp,
  color: Colors.yellow,
);
Icon darkIcon = const Icon(
  Icons.dark_mode_sharp,
  color: Color.fromARGB(255, 206, 186, 55),
);

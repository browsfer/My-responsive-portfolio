import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

//WEATHER API KEY
String weatherApiKey = '3c358157b3ef6a4c54ec50c0b6e9e0a1';

//TOGGLE THEME BUTTON CONSTANTS
Icon lightIcon = const Icon(
  Icons.light_mode_sharp,
  color: Color.fromARGB(255, 255, 208, 0),
);
Icon darkIcon = const Icon(
  Icons.dark_mode_sharp,
  color: Color.fromARGB(255, 206, 186, 55),
);

//Navigation bar padding for iOS
var navBariOs = const EdgeInsets.only(
  left: 10.0,
  right: 10.0,
  bottom: 20.0,
  top: 10.0,
);
//Navigation bar padding for Android
var navBarAndroid = const EdgeInsets.symmetric(
  horizontal: 10.0,
  vertical: 10.0,
);

//My loading animation widget
Widget myLoadingWidget(context) =>
    LoadingAnimationWidget.horizontalRotatingDots(
      color: Theme.of(context).colorScheme.primary,
      size: 50,
    );

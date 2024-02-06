import 'package:cached_network_image/cached_network_image.dart';
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

//My LinkedIn avatar with loading animation
Widget myLinkedInAvatar = CachedNetworkImage(
  imageBuilder: (context, imageProvider) => Container(
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
    ),
  ),
  imageUrl:
      'https://media.licdn.com/dms/image/D5603AQGjn74k0bISlA/profile-displayphoto-shrink_800_800/0/1678993230524?e=1707955200&v=beta&t=rLhwKI7ilDr0KM34dOJ-DYfL9a4qZYnq2IrgadPeR7s',
  placeholder: (context, url) => LoadingAnimationWidget.threeArchedCircle(
      color: Theme.of(context).colorScheme.primary, size: 50),
  errorWidget: (context, url, error) => const Icon(Icons.error),
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

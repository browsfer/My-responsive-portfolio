import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_project/constants/constants.dart';
import 'package:responsive_project/theme/theme.dart';
import 'package:responsive_project/theme/theme_provider.dart';

class MyAdaptiveSwitch extends StatelessWidget {
  const MyAdaptiveSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    //Theme provider variable
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    //Theme data

    return Switch.adaptive(
      value: themeProvider.themeData == darkTheme ? true : false,
      onChanged: (value) {
        themeProvider.toggleTheme();
      },
      applyCupertinoTheme: true,

      //Customize switch
      trackOutlineColor: const MaterialStatePropertyAll(
        Color.fromARGB(255, 48, 99, 40),
      ),
      activeTrackColor: const Color.fromARGB(255, 47, 111, 49),
      inactiveTrackColor: const Color.fromARGB(255, 124, 177, 124),

      //Thumb colors
      inactiveThumbColor: const Color.fromARGB(255, 124, 177, 124),
      activeColor: const Color.fromARGB(255, 47, 111, 49),

      thumbIcon: MaterialStatePropertyAll(
          themeProvider.themeData == darkTheme ? darkIcon : lightIcon),
    );
  }
}

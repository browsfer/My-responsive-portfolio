import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_project/theme/theme_provider.dart';
import 'package:responsive_project/constants/constants.dart';

// ignore: must_be_immutable
class MyButton extends StatefulWidget {
  double? iconSize;

  MyButton({this.iconSize});

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return IconButton(
      iconSize: widget.iconSize,
      onPressed: () {
        if (isLightTheme) {
          themeProvider.toggleTheme();
          setState(() {
            isLightTheme = false;
          });
        } else {
          themeProvider.toggleTheme();
          setState(() {
            isLightTheme = true;
          });
        }
      },
      icon: isLightTheme ? darkIcon : lightIcon,
    );
  }
}

import 'package:flutter/cupertino.dart';
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        lightIcon,
        CupertinoSwitch(
          value: themeProvider.themeData == darkTheme ? true : false,
          onChanged: (value) {
            themeProvider.toggleTheme();
          },
          activeColor: const Color.fromARGB(255, 47, 111, 49),
        ),
        darkIcon,
      ],
    );
  }
}

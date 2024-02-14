import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_project/core/constants.dart';
import 'package:responsive_project/theme/theme.dart';
import 'package:responsive_project/theme/theme_provider.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Check if theme is light or dark
    final _themeProvider = Provider.of<ThemeProvider>(context).themeData;

    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          //My LinkedIn avatar
          FittedBox(
            fit: BoxFit.scaleDown,
            child: WidgetCircularAnimator(
                innerColor: _themeProvider != lightTheme
                    ? Theme.of(context).colorScheme.primaryContainer
                    : const Color.fromARGB(255, 48, 145, 16),
                outerColor: _themeProvider != lightTheme
                    ? Theme.of(context).colorScheme.secondaryContainer
                    : const Color.fromARGB(255, 21, 103, 12),

                //My avatar image
                child: myLinkedInAvatar),
          ),
          const SizedBox(height: 20),

          //About me
          Flexible(
            fit: FlexFit.loose,
            child: SingleChildScrollView(
              child: AutoSizeText(
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
                'Hi, I\'m Kuba, a passionate learner and aspiring Flutter developer with a strong interest in mobile app development. My ultimate goal is to become a skilled Flutter developer and work on challenging projects that allow me to grow my knowledge and expertise. Feel free to connect with me if you\'re interested in collaborating on exciting Flutter projects or if you have any tips or suggestions for me as I continue to develop my skills in this field.',
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

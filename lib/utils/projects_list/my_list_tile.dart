import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:url_launcher/url_launcher.dart';

class MyListTile extends StatelessWidget {
  final String projectUrl;
  final String title;
  final IconData leadingIcon;
  final String projectDescription;

  MyListTile(
      {super.key,
      required this.projectUrl,
      required this.title,
      required this.leadingIcon,
      required this.projectDescription});

  @override
  Widget build(BuildContext context) {
    //Screen sizes
    final height = MediaQuery.of(context).size.height;

    //URL Launching method
    Future<void> _launchUrl(Uri url) async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return Container(
      //Minimum size of my list tile
      constraints: const BoxConstraints(
        minHeight: 160,
      ),

      //Main container design
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(
        top: 10,
        right: 10,
        left: 10,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),

      height: height * 0.25,
      width: double.infinity,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //ICON
              Icon(
                leadingIcon,
                size: 60,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),

              //TITLE
              Expanded(
                flex: 3,
                child: AutoSizeText(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                  maxLines: 2,
                ),
              ),
              const Spacer(),

              //GITHUB BUTTON
              Spring.bubbleButton(
                animDuration: const Duration(seconds: 1),
                child: MaterialButton(
                  onPressed: () {
                    _launchUrl(
                      Uri.parse(projectUrl),
                    );
                  },
                  child: Image.asset(
                    'assets/github.png',
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),

          //PROJECT DESCRIPTION
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: AutoSizeText(
                  projectDescription,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 15,
                  ),
                  softWrap: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

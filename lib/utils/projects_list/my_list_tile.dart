import 'package:flutter/material.dart';
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
          Expanded(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                //ICON
                Icon(
                  leadingIcon,
                  size: 60,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),

                //TITLE
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),

                //GITHUB BUTTON
                MaterialButton(
                  onPressed: () {
                    _launchUrl(
                      Uri.parse(projectUrl),
                    );
                  },
                  child: Image.asset('assets/github.png', height: 50),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                //DESCRIPTION
                Text(
                  projectDescription,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 15,
                  ),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

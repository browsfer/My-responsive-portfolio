import 'package:flutter/material.dart';
import 'package:responsive_project/utils/my_switch.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri _linkedinURL =
        Uri.parse('https://www.linkedin.com/in/jakub-mackowski96/');
    final Uri _githubURL = Uri.parse('https://github.com/browsfer');

    Future<void> _launchUrl(Uri url) async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //My LinkedIn avatar
            const Expanded(
              flex: 4,
              child: DrawerHeader(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
              ),
            ),

            //About me
            Expanded(
              flex: 5,
              child: ListView(
                children: [
                  Text(
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                      'Hi, I\'m Kuba, a passionate learner and aspiring Flutter developer with a strong interest in mobile app development. My ultimate goal is to become a skilled Flutter developer and work on challenging projects that allow me to grow my knowledge and expertise. Feel free to connect with me if you\'re interested in collaborating on exciting Flutter projects or if you have any tips or suggestions for me as I continue to develop my skills in this field.'),
                ],
              ),
            ),
            const SizedBox(height: 10),

            //SOCIAL MEDIA ICONS
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Image.asset('assets/github.png', height: 36),
                    onTap: () {
                      _launchUrl(_githubURL);
                    },
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    child: Image.asset('assets/linkedin.png', height: 36),
                    onTap: () {
                      _launchUrl(_linkedinURL);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //DARK MORDE/LIGHT MODE
            const MyAdaptiveSwitch(),
          ],
        ),
      ),
    );
  }
}

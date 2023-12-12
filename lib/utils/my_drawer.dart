import 'package:flutter/material.dart';
import 'package:responsive_project/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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
      backgroundColor: myBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //My LinkedIn avatar
            const DrawerHeader(
              child: CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    'https://media.licdn.com/dms/image/D5603AQGjn74k0bISlA/profile-displayphoto-shrink_800_800/0/1678993230524?e=1707955200&v=beta&t=rLhwKI7ilDr0KM34dOJ-DYfL9a4qZYnq2IrgadPeR7s'),
              ),
            ),
            //About me
            const Text(
                textAlign: TextAlign.center,
                'Hi, I\'m Kuba, a passionate learner and aspiring Flutter developer with a strong interest in mobile app development. My ultimate goal is to become a skilled Flutter developer and work on challenging projects that allow me to grow my knowledge and expertise. Feel free to connect with me if you\'re interested in collaborating on exciting Flutter projects or if you have any tips or suggestions for me as I continue to develop my skills in this field.'),
            const SizedBox(height: 25),
            Row(
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
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

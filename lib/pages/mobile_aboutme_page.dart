import 'package:flutter/material.dart';
import 'package:responsive_project/constants/constants.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Column(
        children: [
          //My LinkedIn avatar

          DrawerHeader(
            child: ClipPath(
              clipper: const ShapeBorderClipper(
                shape: CircleBorder(),
              ),
              child: FadeInImage(
                placeholder: const AssetImage('assets/placeholder.png'),
                image: const NetworkImage(
                    'https://media.licdn.com/dms/image/D5603AQGjn74k0bISlA/profile-displayphoto-shrink_800_800/0/1678993230524?e=1707955200&v=beta&t=rLhwKI7ilDr0KM34dOJ-DYfL9a4qZYnq2IrgadPeR7s'),
                fadeInDuration: avatarFadeInDuration,
              ),
            ),
          ),
          //About me

          Text(
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
            'Hi, I\'m Kuba, a passionate learner and aspiring Flutter developer with a strong interest in mobile app development. My ultimate goal is to become a skilled Flutter developer and work on challenging projects that allow me to grow my knowledge and expertise. Feel free to connect with me if you\'re interested in collaborating on exciting Flutter projects or if you have any tips or suggestions for me as I continue to develop my skills in this field.',
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

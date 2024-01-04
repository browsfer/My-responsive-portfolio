import 'package:flutter/material.dart';
import 'package:responsive_project/utils/my_drawer.dart';
import 'package:responsive_project/utils/projects_list/my_list_tile.dart';

class MyDesktopScaffold extends StatelessWidget {
  MyDesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Row(
        children: [
          //Body
          Expanded(
            flex: 4,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 10,
              ),
              children: [
                MyListTile(
                  leadingIcon: Icons.attach_money_rounded,
                  title: 'BANKITO',
                  projectDescription:
                      'Bankito - mobile banking app made from the scratch using FirebaseAuth and Firestore, also SQLite to save data locally.',
                  projectUrl: 'https://github.com/browsfer/Bankito',
                ),
                MyListTile(
                  projectUrl:
                      'https://github.com/browsfer/My-responsive-portfolio',
                  title: 'RESPONSIVE PORTFOLIO',
                  leadingIcon: Icons.person_rounded,
                  projectDescription:
                      'My portfolio app - a responsive showcase of my skills and expertise, crafted with modern Material3 themes and engineered with efficiency using Provider for state management, Shared Preferences for data persistence and Geolocation for personalized content tailoring.',
                ),
                MyListTile(
                  projectUrl: 'https://github.com/browsfer/Chatify',
                  title: 'CHATIFY',
                  leadingIcon: Icons.chat_rounded,
                  projectDescription:
                      'Chatify - simple mobile chat app made from the scratch.',
                )
              ],
            ),
          ),

          //Right side open drawer
          Expanded(
            flex: 2,
            child: MyDrawer(),
          ),
        ],
      ),
    );
  }
}

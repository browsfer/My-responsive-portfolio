import 'package:flutter/material.dart';
import 'package:responsive_project/constants/constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: myBackgroundColor,
      child: const Column(
        children: [
          //My photo later
          DrawerHeader(
            child: Icon(
              Icons.account_box_rounded,
              size: 48,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('H O M E'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('A B O U T  M E'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('C O N T A C T'),
          ),
        ],
      ),
    );
  }
}

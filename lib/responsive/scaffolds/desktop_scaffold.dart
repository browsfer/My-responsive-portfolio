import 'package:flutter/material.dart';
import 'package:responsive_project/utils/my_drawer.dart';
import 'package:responsive_project/utils/projects_list/my_projects_list.dart';

class MyDesktopScaffold extends StatelessWidget {
  MyDesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Row(
        children: [
          //Body
          Expanded(
            flex: 3,
            child: MyProjectsList(),
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

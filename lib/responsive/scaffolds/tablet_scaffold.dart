import 'package:flutter/material.dart';
import 'package:responsive_project/utils/my_drawer.dart';
import 'package:responsive_project/utils/my_switch.dart';
import 'package:responsive_project/utils/projects_list/my_projects_list.dart';

class MyTabletScaffold extends StatelessWidget {
  const MyTabletScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: const [MyAdaptiveSwitch()],
      ),
      drawer: MyDrawer(),
      body: const MyProjectsList(),
    );
  }
}

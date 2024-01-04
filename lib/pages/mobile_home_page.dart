import 'package:flutter/material.dart';
import 'package:responsive_project/utils/projects_list/my_projects_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MyProjectsList();
  }
}

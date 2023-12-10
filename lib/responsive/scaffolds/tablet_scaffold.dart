import 'package:flutter/material.dart';
import 'package:responsive_project/utils/my_drawer.dart';

import '../../constants/constants.dart';
import '../../utils/gridView/my_grid_view.dart';
import '../../utils/my_items_list.dart';

class MyTabletScaffold extends StatelessWidget {
  const MyTabletScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: myAppBar,
      drawer: const MyDrawer(),
      body: const Column(
        children: [
          //Grid view with something later
          Expanded(
            child: AspectRatio(
              aspectRatio: 5,
              child: MyGridView(),
            ),
          ),

          //Second part of the body
          Expanded(child: MyItemsList())
        ],
      ),
    );
  }
}
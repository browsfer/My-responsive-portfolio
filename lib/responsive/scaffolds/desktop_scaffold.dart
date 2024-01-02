import 'package:flutter/material.dart';
import 'package:responsive_project/utils/my_drawer.dart';

import '../../constants/constants.dart';
import '../../utils/gridView/my_grid_view.dart';
import '../../utils/my_items_list.dart';

class MyDesktopScaffold extends StatefulWidget {
  MyDesktopScaffold({super.key});

  @override
  State<MyDesktopScaffold> createState() => _MyDesktopScaffoldState();
}

class _MyDesktopScaffoldState extends State<MyDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: const Row(
        children: [
          //Body
          Expanded(
            flex: 3,
            child: Column(
              children: [
                //Grid view with something later
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 4,
                    child: MyGridView(),
                  ),
                ),

                //Second part of the body
                Expanded(
                  child: MyItemsList(),
                ),
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

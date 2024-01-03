import 'package:flutter/material.dart';
import 'package:responsive_project/utils/my_drawer.dart';

import '../../utils/gridView/my_grid_view.dart';
import '../../utils/my_items_list.dart';

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

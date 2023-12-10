import 'package:flutter/material.dart';
import 'package:responsive_project/constants/constants.dart';
import 'package:responsive_project/utils/gridView/my_grid_view.dart';
import 'package:responsive_project/utils/my_drawer.dart';

import '../../utils/my_items_list.dart';

class MyMobileScaffold extends StatelessWidget {
  const MyMobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: myBackgroundColor,
        appBar: myAppBar,
        drawer: const MyDrawer(),
        body: const Column(
          children: [
            //Grid view with something later
            AspectRatio(
              aspectRatio: 2,
              child: MyGridView(),
            ),

            //Second part of the body
            Expanded(
              child: MyItemsList(),
            )
          ],
        ));
  }
}

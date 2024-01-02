import 'package:flutter/material.dart';
import 'package:responsive_project/utils/gridView/my_grid_view.dart';
import 'package:responsive_project/utils/my_items_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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
    );
  }
}

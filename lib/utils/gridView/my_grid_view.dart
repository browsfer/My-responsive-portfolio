import 'package:flutter/material.dart';

import 'my_grid_item.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // crossAxisSpacing: 5,
          // mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return const MyGridItem();
        },
      ),
    );
  }
}

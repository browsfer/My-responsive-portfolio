import 'package:flutter/material.dart';

class MyGridItem extends StatelessWidget {
  const MyGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blueGrey,
      ),
    );
  }
}

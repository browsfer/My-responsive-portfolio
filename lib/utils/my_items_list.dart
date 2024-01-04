import 'package:flutter/material.dart';

class MyItemsList extends StatelessWidget {
  const MyItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.green[900],
            height: 80,
          ),
        );
      },
    );
  }
}

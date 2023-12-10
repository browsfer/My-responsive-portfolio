import 'package:flutter/material.dart';
import 'package:responsive_project/responsive/responsive_layout.dart';
import 'package:responsive_project/responsive/scaffolds/desktop_scaffold.dart';
import 'package:responsive_project/responsive/scaffolds/mobile_scaffold.dart';
import 'package:responsive_project/responsive/scaffolds/tablet_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive dashboard',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ResponsiveLayout(
        desktopScaffold: const MyDesktopScaffold(),
        tabletScaffold: const MyTabletScaffold(),
        mobileScaffold: const MyMobileScaffold(),
      ),
    );
  }
}
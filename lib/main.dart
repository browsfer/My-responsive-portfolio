import 'package:flutter/material.dart';
import 'package:responsive_project/responsive/responsive_layout.dart';
import 'package:responsive_project/responsive/scaffolds/desktop_scaffold.dart';
import 'package:responsive_project/responsive/scaffolds/mobile_scaffold.dart';
import 'package:responsive_project/responsive/scaffolds/tablet_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:responsive_project/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My responsive portfolio',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: ResponsiveLayout(
        desktopScaffold: MyDesktopScaffold(),
        tabletScaffold: const MyTabletScaffold(),
        mobileScaffold: const MyMobileScaffold(),
      ),
    );
  }
}

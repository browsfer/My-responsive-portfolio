import 'package:flutter/material.dart';
import 'package:responsive_project/responsive/responsive_layout.dart';
import 'package:responsive_project/responsive/scaffolds/desktop_scaffold.dart';
import 'package:responsive_project/responsive/scaffolds/mobile_scaffold.dart';
import 'package:responsive_project/responsive/scaffolds/tablet_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:responsive_project/theme/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences themeSettings = await SharedPreferences.getInstance();
  final isDark = themeSettings.getBool('is_dark') ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDark),
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

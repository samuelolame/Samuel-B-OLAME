import 'package:flutter/material.dart';
import 'package:model_me/constants.dart';
import 'package:model_me/responsive/desktop_Screen.dart';
import 'package:model_me/responsive/mobile_Screen.dart';
import 'package:model_me/responsive/responsive_layout.dart';
import 'package:model_me/responsive/tablet_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: kBlue),
        scaffoldBackgroundColor: kIce,
      ),
      home: const ResponsiveLayout(
        mobileScreen: MobileScreen(),
        tableScreen: TabletScreen(),
        desktopScreen: DesktopScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget tableScreen;
  final Widget desktopScreen;

  const ResponsiveLayout({
    super.key,
    required this.mobileScreen,
    required this.tableScreen,
    required this.desktopScreen,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return mobileScreen;
      } else if (constraints.maxWidth < 1100) {
        return tableScreen;
      } else {
        return desktopScreen;
      }
    });
  }
}

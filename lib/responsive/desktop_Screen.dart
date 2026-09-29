import 'package:flutter/material.dart';
import 'package:model_me/constants.dart';
import 'package:model_me/pages/portfolio_page.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PortfolioPage(device: Device.desktop);
  }
}

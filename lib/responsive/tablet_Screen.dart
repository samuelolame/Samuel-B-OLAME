// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:model_me/constants.dart';
import 'package:model_me/pages/portfolio_page.dart';

class TabletScreen extends StatelessWidget {
  const TabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PortfolioPage(device: Device.tablet);
  }
}

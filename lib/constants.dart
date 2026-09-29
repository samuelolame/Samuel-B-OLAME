import 'package:flutter/material.dart';
import 'package:model_me/lang.dart';

// ---------- Couleurs (thème bleu) ----------
const kNavy = Color(0xFF0A1633); // bleu nuit
const kBlue = Color(0xFF2456F5); // bleu principal
const kSky = Color(0xFF8FB4FF); // bleu clair
const kIce = Color(0xFFF3F7FF); // fond clair

// ---------- Menu ----------
List<String> get navItems => [tr('Accueil', 'Home'), 'Portfolio', 'Stats', tr('À propos','About'), 'Contact'];

// ---------- Types d'écran ----------
enum Device { mobile, tablet, desktop }

extension DeviceX on Device {
  bool get isDesktop => this == Device.desktop;
  int get columns => switch (this) {
        Device.mobile => 2,
        Device.tablet => 3,
        Device.desktop => 4,
      };
  double get pad => switch (this) {
        Device.mobile => 20,
        Device.tablet => 40,
        Device.desktop => 80,
      };
}

class AppDrawer extends StatelessWidget {
  final void Function(int index) onSelect;
  const AppDrawer({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kNavy,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'S A M U E L',
                style: TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 4, fontWeight: FontWeight.w300),
              ),
            ),
          ),
          for (var i = 0; i < navItems.length; i++)
            ListTile(
              title: Text(navItems[i].toUpperCase(), style: const TextStyle(color: Colors.white70, letterSpacing: 2)),
              onTap: () {
                Navigator.pop(context);
                onSelect(i);
              },
            ),
        ],
      ),
    );
  }
}

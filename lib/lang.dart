import 'package:flutter/material.dart';

final lang = ValueNotifier<String>('fr');
String tr(String fr, String en) => lang.value == 'fr' ? fr : en;

class LangButton extends StatelessWidget {
  const LangButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: lang,
      builder: (context, l, _) => TextButton(
        onPressed: () => lang.value = l == 'fr' ? 'en' : 'fr',
        child: Text(
          l == 'fr' ? 'EN' : 'FR',
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

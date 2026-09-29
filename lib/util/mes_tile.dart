import 'package:flutter/material.dart';
import 'package:model_me/constants.dart';

/// Une ligne de mensuration
class Mytile extends StatelessWidget {
  final String label;
  final String value;
  const Mytile({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: kBlue.withValues(alpha: 0.25))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label.toUpperCase(),
              style: TextStyle(color: kNavy.withValues(alpha: 0.6), fontSize: 12, letterSpacing: 2)),
          Text(value, style: const TextStyle(color: kNavy, fontSize: 18, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

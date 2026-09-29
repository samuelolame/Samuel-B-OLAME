import 'package:flutter/material.dart';
import 'package:model_me/constants.dart';
import 'package:model_me/data/model_data.dart';

class MyBox extends StatefulWidget {
  final Photo photo;
  const MyBox({super.key, required this.photo});

  @override
  State<MyBox> createState() => _MyBoxState();
}

class _MyBoxState extends State<MyBox> {
  bool hover = false;

  void _openFullscreen() {
    showDialog(
      context: context,
      builder: (ctx) => Dialog.fullscreen(
        backgroundColor: Colors.black.withValues(alpha: 0.92),
        child: Stack(
          children: [
            Center(child: InteractiveViewer(child: Image.asset(widget.photo.path, fit: BoxFit.contain))),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.pop(ctx),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: _openFullscreen,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedScale(
                scale: hover ? 1.06 : 1,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(widget.photo.path, fit: BoxFit.cover, alignment: Alignment.topCenter),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [kNavy.withValues(alpha: 0.85), Colors.transparent],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

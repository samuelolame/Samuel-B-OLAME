import 'package:flutter/material.dart';
import 'package:model_me/constants.dart';
import 'package:model_me/data/model_data.dart';

class MyBox extends StatefulWidget {
  final Photo photo;
  final List<Photo> photos;
  const MyBox({super.key, required this.photo, required this.photos});

  @override
  State<MyBox> createState() => _MyBoxState();
}

class _MyBoxState extends State<MyBox> {
  bool hover = false;

  void _openFullscreen() {
    final photos = widget.photos;
    final start = photos.indexWhere((p) => p.path == widget.photo.path);
    final controller = PageController(initialPage: start < 0 ? 0 : start);
    int current = start < 0 ? 0 : start;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) {
          void go(int delta) {
            final target = current + delta;
            if (target < 0 || target >= photos.length) return;
            controller.animateToPage(
              target,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
            );
          }

          return Dialog.fullscreen(
            backgroundColor: Colors.black.withValues(alpha: 0.52),
            child: Stack(
              children: [
                PageView.builder(
                  controller: controller,
                  itemCount: photos.length,
                  onPageChanged: (i) => setDialogState(() => current = i),
                  itemBuilder: (_, i) => Center(
                    child: InteractiveViewer(
                      constrained: true,
                      child: Image.asset(photos[i].path, fit: BoxFit.fitWidth),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ),
                if (current > 0)
                  Positioned(
                    left: 8,
                    top: 280,
                    bottom: 280,
                    child: IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () => go(-1),
                    ),
                  ),
                if (current < photos.length - 1)
                  Positioned(
                    right: 8,
                    top: 280,
                    bottom: 280,
                    child: IconButton(
                      icon: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () => go(1),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    ).then((_) => controller.dispose());
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
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              AnimatedScale(
                scale: hover ? 1.06 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  widget.photo.path,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        kNavy.withValues(alpha: 0.85),
                        Colors.transparent,
                      ],
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

import 'package:flutter/material.dart';
import 'package:otaku_scope/core/widgets/shimmer_box.dart';

class CoverThumb extends StatelessWidget {
  final String imageUrl;
  final double width;

  const CoverThumb({super.key, required this.imageUrl, required this.width});

  @override
  Widget build(BuildContext context) {
    // Keep a poster-like 2:3 ratio
    final height = width * 1.5;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierColor: Colors.black.withOpacity(0.85),
          builder: (_) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  InteractiveViewer(
                    minScale: 0.8,
                    maxScale: 5,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.broken_image, color: Colors.white70, size: 48)),
                    ),
                  ),
                  Positioned(
                    top: 24,
                    right: 24,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          // Shadowing for the cover
          BoxShadow(
            color: Colors.black54,
            blurRadius: 12,
            spreadRadius: 1,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            const ShimmerBox(width: double.infinity, height: double.infinity),
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, _) => Container(color: Colors.black26),
            ),
            // Gradient overlay on the cover (top->bottom) for subtle depth
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x22000000),
                    Color(0x00000000),
                    Color(0x11000000),
                    Color(0x44000000),
                  ],
                  stops: [0.0, 0.3, 0.7, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

import 'dart:math' as math;

import 'package:flutter/material.dart';

class ShimmerBox extends StatefulWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.baseColor = const Color(0xFF1E1E1E),
    this.highlightColor = const Color(0x33222222),
    this.duration = const Duration(milliseconds: 1400),
  });

  @override
  State<ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<ShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final shimmerPosition = _controller.value;
          return ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
            child: CustomPaint(
              size: Size(widget.width, widget.height),
              painter: _ShimmerPainter(
                baseColor: widget.baseColor,
                highlightColor: widget.highlightColor,
                position: shimmerPosition,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ShimmerPainter extends CustomPainter {
  final Color baseColor;
  final Color highlightColor;
  final double position; // 0..1

  _ShimmerPainter({
    required this.baseColor,
    required this.highlightColor,
    required this.position,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = baseColor;
    final rect = Offset.zero & size;
    canvas.drawRect(rect, paint);

    // Shimmer gradient band moves diagonally across
    final width = size.width;
    final height = size.height;
    final maxExtent = math.sqrt(width * width + height * height);
    final bandWidth = maxExtent * 0.25;
    final start = (position * (maxExtent + bandWidth)) - bandWidth;

    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.transparent,
        highlightColor,
        Colors.transparent,
      ],
      stops: const [0.35, 0.5, 0.65],
    );

    final shaderRect = Rect.fromLTWH(start - height, 0, bandWidth, maxExtent);
    final shimmerPaint = Paint()..shader = gradient.createShader(shaderRect);
    canvas.drawRect(rect, shimmerPaint);
  }

  @override
  bool shouldRepaint(covariant _ShimmerPainter oldDelegate) {
    return oldDelegate.position != position ||
        oldDelegate.baseColor != baseColor ||
        oldDelegate.highlightColor != highlightColor;
  }
}



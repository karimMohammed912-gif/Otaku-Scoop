import 'package:flutter/material.dart';
import 'package:otaku_scope/core/widgets/shimmer_box.dart';

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerBox(width: double.infinity, height: 140, borderRadius: BorderRadius.zero),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShimmerBox(width: 88, height: 132),
                SizedBox(width: 12),
                Expanded(child: ShimmerBox(width: double.infinity, height: 80)),
              ],
            ),
            const SizedBox(height: 16),
            const ShimmerBox(width: double.infinity, height: 36, borderRadius: BorderRadius.all(Radius.circular(8))),
            const SizedBox(height: 8),
            const Expanded(child: ShimmerBox(width: double.infinity, height: double.infinity, borderRadius: BorderRadius.all(Radius.circular(8)))),
          ],
        ),
      ),
    );
  }
}

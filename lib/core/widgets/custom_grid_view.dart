import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:otaku_scope/core/widgets/grid_item_widget.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({
    super.key,
  });

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Animation<double>> _itemAnimations;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Create staggered animations for grid items
    _itemAnimations = List.generate(20, (index) {
      final delay = index * 0.0005; // 50ms delay between items
      final start = (delay).clamp(0.0, 0.8);
      final end = (start + 0.4).clamp(0.2, 1.0);
      
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(start, end, curve: Curves.linear),
        ),
      );
    });

    // Start animation after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 2.0,
        childAspectRatio: 9 / 16,
      ),
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _itemAnimations[index],
          builder: (context, child) {
            return FadeScaleTransition(
              animation: _itemAnimations[index],
              child: const GridItemWidget(),
            );
          },
        );
      },
    );
  }
}

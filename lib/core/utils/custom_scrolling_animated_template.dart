import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';

import '../resources/values_manager.dart';

class CustomScrollingAnimatedTemplate extends StatelessWidget {
  const CustomScrollingAnimatedTemplate({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: AnimationLimiter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: IntManager.i_700),
                  childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: DoubleManager.d_25,
                        child: FadeInAnimation(child: widget),
                      ),
                  children: children),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../core/resources/values_manager.dart';

class CartCard extends StatelessWidget {
  final Widget child;
  const CartCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: DoubleManager.d_5,
        margin: const EdgeInsets.symmetric(
            horizontal: DoubleManager.d_30, vertical: DoubleManager.d_10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: child);
  }
}

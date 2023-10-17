import 'package:flutter/material.dart';

class TopScreenBackArrow extends StatelessWidget {
  final VoidCallback navigateFunction;
  const TopScreenBackArrow({
    Key? key,
    required this.navigateFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: navigateFunction,
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MainGradientContainer extends StatelessWidget {
  const MainGradientContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 226, 116, 116),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child);
  }
}

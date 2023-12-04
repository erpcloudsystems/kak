import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, required this.assetPath, required this.text});

  final String assetPath, text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [Image.asset(assetPath, width: double.infinity), Text(text)],
      ),
    );
  }
}

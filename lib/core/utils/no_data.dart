import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/error.png',
            width: double.infinity,
          ),
          const Text(
            'No data',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}

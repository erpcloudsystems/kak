import 'package:flutter/material.dart';

class HaveAccountWidget extends StatelessWidget {
  final String question;
  final String buttonText;
  final String routeName;
  const HaveAccountWidget({
    super.key,
    required this.question,
    required this.buttonText,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(routeName),
          child: Text(buttonText),
        )
      ],
    );
  }
}

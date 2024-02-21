import 'package:flutter/widgets.dart';

import '../resources/assetss_path.dart';

class GeneralBackground extends StatelessWidget {
  const GeneralBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImagesPath.backgroundPath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        child,
      ],
    );
  }
}

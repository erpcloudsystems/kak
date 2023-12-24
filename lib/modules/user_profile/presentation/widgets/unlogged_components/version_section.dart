import 'package:flutter/material.dart';
import 'package:kak/core/resources/strings_manager.dart';
import 'package:kak/core/resources/values_manager.dart';

class VersionSection extends StatelessWidget {
  const VersionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: DoubleManager.d_8, top: DoubleManager.d_40),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            StringsManager.version,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(width: DoubleManager.d_20),
          // TODO: Implement version logic.
          Text('1.0.0', style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

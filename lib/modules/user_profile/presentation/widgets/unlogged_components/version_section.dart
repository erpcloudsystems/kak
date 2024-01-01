import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class VersionSection extends StatefulWidget {
  const VersionSection({super.key});

  @override
  State<VersionSection> createState() => _VersionSectionState();
}

class _VersionSectionState extends State<VersionSection> {
  String versionNumber = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: DoubleManager.d_8, top: DoubleManager.d_40),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            StringsManager.version(context),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(width: DoubleManager.d_20),
          Text(
            versionNumber,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getPackageInfo();
  }

  Future<void> _getPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() => versionNumber = info.version);
  }
}

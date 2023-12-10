import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../../../../core/resources/strings_manager.dart';
import '../widgets/address/map_snapshot_section.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapSnapshot = ModalRoute.of(context)!.settings.arguments as Uint8List;

    return Scaffold(
        appBar: AppBar(title: const Text(StringsManager.newAddress)),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              MapSnapshotSection(mapSnapshot: mapSnapshot),
            ],
          ),
        ));
  }
}

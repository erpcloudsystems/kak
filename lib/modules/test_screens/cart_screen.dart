import 'package:flutter/material.dart';

import '../../core/resources/strings_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringsManager.cart)),
      body: const SizedBox(),
    );
  }
}

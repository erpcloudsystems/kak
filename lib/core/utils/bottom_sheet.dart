import 'package:flutter/material.dart';

abstract class BottomSheetUtil {
  static void bottomSheetBuilder({
    required Widget bottomSheetView,
    required BuildContext context,
  }) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      context: context,
      builder: ((context) => bottomSheetView),
    );
  }
}

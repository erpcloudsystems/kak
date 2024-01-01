import 'package:flutter/material.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class IsPrimarySwitch extends StatefulWidget {
  const IsPrimarySwitch({super.key, required this.toggleSwitch});

  final Function(bool) toggleSwitch;

  @override
  State<IsPrimarySwitch> createState() => _IsPrimarySwitchState();
}

class _IsPrimarySwitchState extends State<IsPrimarySwitch> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DoubleManager.d_8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringsManager.defaultAddress(context),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorsManager.swatchRed),
              ),
              SizedBox(
                height: DoubleManager.d_35,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Switch(
                    value: isSelected,
                    onChanged: ((value) => setState(() {
                          isSelected = value;
                          widget.toggleSwitch(value);
                        })),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

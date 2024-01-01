import 'package:kak/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/values_manager.dart';

class ChooseYourOrder extends StatelessWidget {
  const ChooseYourOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -DoubleManager.d_45,
      left: DoubleManager.d_10,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: DoubleManager.d_5,
                  spreadRadius: DoubleManager.d_1,
                  offset: Offset(DoubleManager.d_3, DoubleManager.d_3),
                )
              ],
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                StringsManager.chooseOrderType(context),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: FontsSize.s10),
              ),
              Row(
                children: [
                  Text(
                    StringsManager.clickHereToDetermineYourOrderType(context),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: FontsSize.s10, color: Colors.black),
                  ),
                  const SizedBox(width: DoubleManager.d_8),
                  const Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ]),
          ),
          const SizedBox(width: DoubleManager.d_15),
          Container(
              padding: const EdgeInsets.symmetric(vertical: DoubleManager.d_2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(DoubleManager.d_12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: DoubleManager.d_5,
                    spreadRadius: DoubleManager.d_1,
                    offset: Offset(DoubleManager.d_3, DoubleManager.d_3),
                  )
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}

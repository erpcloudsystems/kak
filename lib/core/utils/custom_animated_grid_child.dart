import 'package:flutter/material.dart';

import 'custom_cached_image.dart';
import '../resources/fonts_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';

class CustomAnimatedGridChild extends StatelessWidget {
  const CustomAnimatedGridChild({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  final String imageUrl, description, price;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: IntManager.i_4,
          child: Container(
            margin: const EdgeInsets.only(bottom: DoubleManager.d_5),
            decoration: BoxDecoration(
              color: Colors.white70,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(DoubleManager.d_15),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomCachedImage(url: imageUrl),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      // TODO: IMPLEMENT ADD TO CART LOGIC.
                      onPressed: () {},
                      icon: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(DoubleManager.d_8),
                            color: ColorsManager.mainColor.withOpacity(.8),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: DoubleManager.d_25,
                            color: Colors.white,
                          ))),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          flex: IntManager.i_1,
          child: Text(
            description,
            overflow: TextOverflow.clip,
            softWrap: true,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: FontsSize.s11),
          ),
        ),
        Flexible(
            flex: IntManager.i_1,
            fit: FlexFit.loose,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'EGP ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: FontsSize.s12),
                ),
                Text(
                  price,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: FontsSize.s12),
                ),
              ],
            )),
      ],
    );
  }
}
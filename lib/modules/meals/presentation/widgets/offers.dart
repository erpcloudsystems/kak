import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'dots_indicator.dart';
import 'choose_ur_order.dart';
import '../../domain/entities/meal_entity.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';

class Offers extends StatefulWidget {
  const Offers({super.key, required this.itemList});
  final List<MealEntity> itemList;

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  int currentSliderIndex = IntManager.i_0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            viewportFraction: 1.0,
            autoPlay: true,
            onPageChanged: (index, reason) =>
                setState(() => currentSliderIndex = index),
          ),
          itemCount: widget.itemList.length,
          itemBuilder: (context, index, realIndex) => GestureDetector(
            key: const Key('offer'),
            // TODO: implement navigation call
            // onTap: () => Navigator.of(context).pushNamed(
            //   Routes.productDetails,
            //   arguments: item,
            // ),
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.black,
                  ],
                  stops: [0, 0.3, 0.5, 1],
                ).createShader(
                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode.dstIn,
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) =>
                    const LoadingIndicatorUtil(),
                imageUrl: widget.itemList[index].imageUrl,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
        ),
        const ChooseYourOrder(),
        OfferDotsIndicator(
          currentSliderIndex: currentSliderIndex,
          offersList: widget.itemList,
        )
      ],
    );
  }
}


// TODO: complete late.
// class ChooseYourMealDropDownFormField extends StatefulWidget {
//   const ChooseYourMealDropDownFormField({
//     super.key,
//     required this.selectedValue,
//   });

//   final Function selectedValue;

//   @override
//   State<ChooseYourMealDropDownFormField> createState() =>
//       _ChooseYourMealDropDownFormFieldState();
// }

// class _ChooseYourMealDropDownFormFieldState
//     extends State<ChooseYourMealDropDownFormField> {
//   String? _selected;
//   final List<String> chooseUrMealDummyList = [
//     'family meal',
//     'a new offer meal'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       style: getRegularStyle(
//           fontName: FontsName.detailsFont, fontSize: FontsSize.s16),
//       validator: (value) {
//         if (value == null) {
//           return StringsManager.emptyValidator;
//         }
//         return null;
//       },
//       decoration: const InputDecoration(
//         border: InputBorder.none,
//         labelText: 'Choose ur meal',
//         alignLabelWithHint: true,
//         hintText: 'Press here to choose an offer',
//       ),
//       value: _selected,
//       items: chooseUrMealDummyList.map((e) {
//         return DropdownMenuItem<String>(
//           value: e,
//           child: Text(e),
//         );
//       }).toList(),
//       onChanged: (String? newValue) {
//         setState(() {
//           _selected = newValue;
//           widget.selectedValue(_selected);
//         });
//       },
//     );
//   }
// }

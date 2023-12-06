import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'choose_ur_order.dart';
import 'dots_indicator.dart';
import '../bloc/meals_bloc.dart';
import 'offers/bottom_sheet.dart';
import 'upper_screen_meal_image.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/meal_entity.dart';
import '../../../../core/utils/bottom_sheet.dart';
import '../../../../core/resources/values_manager.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsBloc, MealsState>(
      buildWhen: (previous, current) =>
          previous.getOffersState != current.getOffersState,
      builder: (context, state) {
        if (state.getOffersState == RequestState.error) {
          return Center(child: Text(state.getOffersMessage));
        }
        if (state.getOffersState == RequestState.success) {
          return OffersSection(offersList: state.getOffersData);
        }
        return const SizedBox();
      },
    );
  }
}

class OffersSection extends StatefulWidget {
  const OffersSection({super.key, required this.offersList});
  final List<MealEntity> offersList;
  @override
  State<OffersSection> createState() => _OffersSectionState();
}

class _OffersSectionState extends State<OffersSection> {
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
          itemCount: widget.offersList.length,
          itemBuilder: (context, index, realIndex) => GestureDetector(
            key: const Key('offer'),
            onTap: () => BottomSheetUtil.bottomSheetBuilder(
              bottomSheetView: OffersBottomSheetView(
                meal: widget.offersList[index],
              ),
              context: context,
            ),
            child: UpperScreenMealImage(
                imageUrl: widget.offersList[index].imageUrl),
          ),
        ),
        const ChooseYourOrder(),
        OfferDotsIndicator(
          currentSliderIndex: currentSliderIndex,
          offersList: widget.offersList,
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


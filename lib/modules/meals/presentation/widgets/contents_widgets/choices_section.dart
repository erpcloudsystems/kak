import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'meal_details_section.dart';
import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/meal_component.dart';
import '../../../../../core/utils/snack_bar_util.dart';
import '../../../../../core/global/global_varibles.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/utils/check_box_form_field.dart';

class ComponentsSection extends StatelessWidget {
  const ComponentsSection(
      {required this.componentsList, super.key, required this.price});

  final List<MealComponentEntity> componentsList;
  final ValueNotifier<double> price;

  @override
  Widget build(BuildContext context) {
    // Sorting every section of component together.
    Map<String, List<MealComponentEntity>> groupedMap =
        groupBy(componentsList, (obj) => obj.itemClassification);

    return SliverList.builder(
        itemCount: groupedMap.length,
        itemBuilder: (context, index) {
          // Here we build the list of every group.
          if (index < groupedMap.length) {
            String groupName = groupedMap.keys.elementAt(index);
            List<MealComponentEntity> choicesList =
                groupedMap[groupName]!.map((obj) => obj).toList();

            return ChoicesSection(choicesList: choicesList, price: price);
          }
          return Container();
        });
  }
}

class ChoicesSection extends StatefulWidget {
  const ChoicesSection(
      {super.key, required this.choicesList, required this.price});
  final List<MealComponentEntity> choicesList;
  final ValueNotifier<double> price;

  @override
  State<ChoicesSection> createState() => _ChoicesSectionState();
}

class _ChoicesSectionState extends State<ChoicesSection> {
  final gv = GlobalVariables();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: DoubleManager.d_10),
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: widget.choicesList.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) =>
                const Divider(height: 1, color: Colors.grey, thickness: .2),
            itemBuilder: (context, index) {
              return CheckboxFormField(
                title: MealDetailsSection(widget: widget, index: index),
                value: gv.getChosenList.contains(widget.choicesList[index]),
                checkboxShape: const CircleBorder(),
                onChanged: (bool? value) => addToChosenList(value, index),
                validator: (_) => validateSection(widget.choicesList),
                initialValue: widget.choicesList[index].componentType ==
                        ComponentType.required
                    ? true
                    : null,
              );
            }),
      );

/* This method take the user choice and add the component to the choices list
 or remove it, but only if the component is not required in the meal,
 if it's required it won't be removed. */
  void addToChosenList(bool? value, int index) {
    return setState(() {
      switch (value) {
        case true:
          if (canAddItem(widget.choicesList[index])) {
            gv.addToChosenList(widget.choicesList[index]);
            widget.price.value =
                widget.price.value + widget.choicesList[index].price;
          } else {
            SnackBarUtil().getSnackBar(
              context: context,
              message: StringsManager.maximumNumberError(
                  widget.choicesList[index].maxRequired.toString()),
              color: ColorsManager.gRed,
            );
          }
          break;
        case false:
          if (widget.choicesList[index].componentType !=
              ComponentType.required) {
            gv.removeFromChosenList(widget.choicesList[index]);
            widget.price.value =
                widget.price.value - widget.choicesList[index].price;
          }
          break;
        default:
      }
    });
  }

  /// Check if adding the item violates the maxRequired limit
  bool canAddItem(MealComponentEntity item) {
    if (item.componentType != ComponentType.optional && item.maxRequired > 0) {
      int count = gv.getChosenList
          .where((chosenItem) =>
              chosenItem.itemClassification == item.itemClassification)
          .length;

      return count < item.maxRequired;
    }
    // Allow adding items that are not required
    return true;
  }

  /// Validation function for the state of the component and it's priority.
  String? validateSection(List<MealComponentEntity> choicesList) {
    switch (choicesList[0].componentType) {
      case ComponentType.atLeastOne:
        if (gv.getChosenList.any((MealComponentEntity element) =>
            element.itemClassification == choicesList[0].itemClassification)) {
          return null;
        } else {
          return StringsManager.oneItemIsRequired(
              choicesList[0].itemClassification);
        }
      case ComponentType.required:
        if (gv.getChosenList.any((MealComponentEntity element) =>
            element.itemClassification == choicesList[0].itemClassification)) {
          return null;
        } else {
          return StringsManager.itemIsRequired(
              choicesList[0].itemClassification);
        }

      case ComponentType.optional:
        return null;
    }
  }

  @override
  void initState() {
    super.initState();
    for (var choice in widget.choicesList) {
      // Add the required components in the choices list in the beginning.
      if (choice.componentType == ComponentType.required &&
          !gv.getChosenList.contains(choice)) {
        gv.addToChosenList(choice);
      }
    }
  }
}

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/meal_component.dart';
import '../../../../../core/global/global_varibles.dart';
import '../../../../../core/resources/values_manager.dart';

class ComponentsSection extends StatelessWidget {
  const ComponentsSection({
    required this.componentsList,
    super.key,
  });

  final List<MealComponentEntity> componentsList;

  @override
  Widget build(BuildContext context) {
    Map<String, List<MealComponentEntity>> groupedMap =
        groupBy(componentsList, (obj) => obj.itemClassification);

    return SliverList.builder(
        itemCount: groupedMap.length,
        itemBuilder: (context, index) {
          if (index < groupedMap.length) {
            String groupName = groupedMap.keys.elementAt(index);
            List<MealComponentEntity> choicesList =
                groupedMap[groupName]!.map((obj) => obj).toList();

            return ChoicesSection(choicesList: choicesList);
          }
          return Container();
        });
  }
}

class ChoicesSection extends StatefulWidget {
  const ChoicesSection({super.key, required this.choicesList});
  final List<MealComponentEntity> choicesList;

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
          itemBuilder: (context, index) => CheckboxListTile(
              title: Text(widget.choicesList[index].itemName),
              value: gv.getChosenList.contains(widget.choicesList[index]),
              checkboxShape: const CircleBorder(),
              onChanged: (bool? value) {
                setState(() {
                  switch (value) {
                    case true:
                      gv.addToChosenList(widget.choicesList[index]);
                      break;
                    case false:
                      gv.removeFromChosenList(widget.choicesList[index]);
                      break;
                    default:
                  }
                });
              }),
        ),
      );
}

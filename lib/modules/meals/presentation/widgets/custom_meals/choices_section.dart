import 'package:flutter/material.dart';
import 'package:kak/core/resources/values_manager.dart';

class ChoicesSection extends StatefulWidget {
  const ChoicesSection({super.key, required this.choicesList});
  final List<String> choicesList;

  @override
  State<ChoicesSection> createState() => _ChoicesSectionState();
}

class _ChoicesSectionState extends State<ChoicesSection> {
  late List<bool> checkedList;

  @override
  void initState() {
    super.initState();
    checkedList = List.filled(widget.choicesList.length, false);
  }

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.only(bottom: DoubleManager.d_10),
        sliver: SliverList.separated(
          itemCount: widget.choicesList.length,
          separatorBuilder: (context, index) =>
              const Divider(height: 1, color: Colors.grey, thickness: .2),
          itemBuilder: (context, index) => CheckboxListTile(
              title: Text(widget.choicesList[index]),
              value: checkedList[index],
              checkboxShape: const CircleBorder(),
              onChanged: (bool? value) =>
                  setState(() => checkedList[index] = value ?? false)),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:kak/core/utils/enums.dart';
import 'package:kak/modules/meals/domain/entities/meal_component.dart';

class GlobalVariables {
  static final GlobalVariables _globalVariables = GlobalVariables._internal();

  bool _ifUserWantedToBeRemembered = false;
  String? _sid, _globalUserPassword;
  DeviceLanguage? _deviceLanguage;
  final Set<MealComponentEntity> _chosenMealsComponents = {};

  factory GlobalVariables() => _globalVariables;

  GlobalVariables._internal();

  String? get getGlobalUserPassword => _globalUserPassword;
  set setGlobalUserPassword(String password) => _globalUserPassword = password;

  bool get getUserDecision => _ifUserWantedToBeRemembered;
  set setUserDecision(bool decision) => _ifUserWantedToBeRemembered = decision;

  String? get getSid => _sid;
  set setSid(String sid) => _sid = sid;

  DeviceLanguage? get getDeviceLanguage => _deviceLanguage;
  set setDeviceLanguage(DeviceLanguage deviceLanguage) =>
      _deviceLanguage = deviceLanguage;

  void addToChosenList(MealComponentEntity mealComponent) {
    _chosenMealsComponents.add(mealComponent);
    debugPrint('Adding call: ${_chosenMealsComponents.toString()}');
  }

  void removeFromChosenList(MealComponentEntity mealComponent) {
    _chosenMealsComponents.remove(mealComponent);
    debugPrint('Remove call: ${_chosenMealsComponents.toString()}');
  }

  void clearChosenList() {
    _chosenMealsComponents.clear();
  }

  Set<MealComponentEntity> get getChosenList => _chosenMealsComponents;
}

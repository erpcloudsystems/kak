import 'package:kak/core/resources/strings_manager.dart';

import 'enums.dart';

extension ComponentTypeExtension on String {
  /// This extension to return the priority of every component.
  ComponentType checkComponentType() {
    switch (this) {
      case 'Item Must Be Selected':
        return ComponentType.required;

      case 'Minimum 1 Item is Required In Section':
        return ComponentType.atLeastOne;

      case 'All Items Section are Optional':
        return ComponentType.optional;

      default:
        return ComponentType.optional;
    }
  }
}

extension ThePaymentTypeName on PaymentType {
  String get value {
    switch (this) {
      case PaymentType.creditCard:
        return StringsManager.creditCard;
      case PaymentType.cash:
        return StringsManager.cash;
    }
  }
}

import 'package:intl/intl.dart';


import 'enums.dart';
import '../resources/strings_manager.dart';
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
  /// This extension return the name of the payment type in readable way.
  String get value {
    switch (this) {
      case PaymentType.creditCard:
        return StringsManager.creditCard;
      case PaymentType.cash:
        return StringsManager.cash;
    }
  }
}


extension DateTimeExtension on DateTime {
  String formatDate() {
    /// Formate date in [day - month - year].
    return DateFormat('dd-MM-yyyy').format(this);
  }

  String formatDateYMD() {
    /// Formate date in [year - month - day].
    return DateFormat('yyyy-MM-dd').format(this);
  }
}

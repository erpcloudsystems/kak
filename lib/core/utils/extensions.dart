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
  /// Formate date in [day - month - year].
  String formatDate() {
    return DateFormat('dd-MM-yyyy').format(this);
  }

  /// Formate date in [year - month - day].
  String formatDateYMD() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}

extension DoctypeStatusExtension on String {
  /// This extension to return the status of the doctype.
  DoctypeStatus checkDoctypeStatus() {
    switch (this) {
      case 'Draft':
        return DoctypeStatus.draft;
      case 'Cancelled':
        return DoctypeStatus.cancelled;

      case 'Completed':
        return DoctypeStatus.completed;

      case 'To Deliver':
        return DoctypeStatus.toDeliver;

      case 'Closed':
        return DoctypeStatus.closed;

      case 'To Bill':
        return DoctypeStatus.toBill;

      case 'To Deliver and Bill':
        return DoctypeStatus.toDeliverAndBill;

      case 'On Hold':
        return DoctypeStatus.onHold;

      default:
        return DoctypeStatus.draft;
    }
  }
}

import 'enums.dart';

extension ComponentTypeExtension on String {
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

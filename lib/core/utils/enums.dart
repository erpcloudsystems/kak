enum RequestState { stable, loading, success, error }

enum MealType { regular, spicy }

enum LoadingType { linear, circular }

enum DeviceLanguage { english, arabic }

enum ComponentType { atLeastOne, required, optional }

enum PaymentType { creditCard, cash }

enum DoctypeStatus {
  draft,
  onHold,
  toDeliverAndBill,
  toBill,
  toDeliver,
  completed,
  cancelled,
  closed,
}

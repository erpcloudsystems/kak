import '../../domain/entities/taxes.dart';

class TaxesModel extends TaxesEntity {
  const TaxesModel({required super.deliverFee, required super.taxes});

  factory TaxesModel.fromJson(Map<String, dynamic> json) {
    double deliveryFee = 0.0;
    double taxes = 0.0;

    // Find the entry with "charge_type": "Actual" and extract "tax_amount"
    final Map<String, dynamic> actualCharge = List.from(['taxes']).firstWhere(
      (entry) => entry['charge_type'] == 'Actual',
      orElse: () => {},
    );
    if (actualCharge.isNotEmpty) {
      deliveryFee = actualCharge['tax_amount'] ?? 0.0;
    }

    // Find the entry with "charge_type": "On Net Total" and extract "rate"
    final Map<String, dynamic> onNetTotalCharge =
        List.from(json['taxes']).firstWhere(
      (entry) => entry['charge_type'] == 'On Net Total',
      orElse: () => {},
    );
    if (onNetTotalCharge.isNotEmpty) {
      taxes = onNetTotalCharge['rate'] ?? 0.0;
    }

    return TaxesModel(deliverFee: deliveryFee, taxes: taxes);
  }
}

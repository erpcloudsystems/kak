import '../../domain/entities/taxes.dart';

class TaxesModel extends TaxesEntity {
  const TaxesModel({required super.deliverFee, required super.taxes});

  factory TaxesModel.fromJson(Map<String, dynamic> json) =>
      TaxesModel(deliverFee: json['Delivery Fee'], taxes: json['taxes']);
}

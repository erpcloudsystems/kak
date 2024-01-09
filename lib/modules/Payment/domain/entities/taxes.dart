import 'package:equatable/equatable.dart';

class TaxesEntity extends Equatable {
  final double deliverFee, taxes;

  const TaxesEntity({required this.deliverFee, required this.taxes});

  @override
  
  List<double> get props => [deliverFee, taxes];
}

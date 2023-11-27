import 'package:equatable/equatable.dart';

class MealsGroupEntity extends Equatable {
  final String name, imageUrl;

  const MealsGroupEntity({
    required this.imageUrl,
    required this.name,
  });

  @override
  List<Object?> get props => [imageUrl, name];
}

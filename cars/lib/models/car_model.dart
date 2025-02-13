import 'package:hive/hive.dart';

part 'car_model.g.dart';

@HiveType(typeId: 0)
class CarModel extends HiveObject {
  @HiveField(0)
  String make;

  @HiveField(1)
  String model;

  @HiveField(2)
  int year;

  CarModel({required this.make, required this.model, required this.year});
}

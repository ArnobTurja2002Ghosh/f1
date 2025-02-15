import 'package:hive/hive.dart';

part 'car_model.g.dart';

@HiveType(typeId: 0)
class CarModel extends HiveObject {
  @HiveField(0)
  String description;

  @HiveField(1)
  String date;

  @HiveField(2)
  double rate;

  CarModel({required this.description, required this.rate, required this.date});
}

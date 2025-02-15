import 'package:hive/hive.dart';

import '../models/car_model.dart';

class CarController {
  final box = Hive.box<CarModel>('cars_box');

  void addCar(CarModel car) {
    box.add(car);
  }

  void updateCar(int index, CarModel car) {
    box.putAt(index, car);
  }

  Future<void> deleteCar(int index) async {
    await box.deleteAt(index);
    await box.compact();
  }

  List<CarModel> getAllCars() {
    return box.values.toList();
  }
}

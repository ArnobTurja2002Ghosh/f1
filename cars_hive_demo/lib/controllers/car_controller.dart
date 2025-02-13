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

  void deleteCar(int index) {
    box.deleteAt(index);
  }

  List<CarModel> getAllCars() {
    return box.values.toList();
  }
}

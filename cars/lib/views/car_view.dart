import 'package:flutter/material.dart';
import '../controllers/car_controller.dart';
import '../models/car_model.dart';
import 'add_car_view.dart';

class CarView extends StatefulWidget {
  const CarView({super.key});

  @override
  State<CarView> createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  final CarController carController = CarController();

  @override
  Widget build(BuildContext context) {
    var cars = carController.getAllCars();

    return Scaffold(
      appBar: AppBar(title: const Text('Car List')),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          var car = cars[index];
          return ListTile(
            title: Text("${car.year} ${car.make} ${car.model}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editCar(context, index, car),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    carController.deleteCar(index);
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addCar(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addCar(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddCarView(onCarAdded: () => setState(() {}))),
    );
  }

  void _editCar(BuildContext context, int index, CarModel car) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCarView(
          car: car,
          onCarAdded: () => setState(() {}),
          index: index,
        ),
      ),
    );
  }
}

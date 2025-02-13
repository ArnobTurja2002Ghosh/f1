import 'package:flutter/material.dart';
import '../controllers/car_controller.dart';
import '../models/car_model.dart';

class AddCarView extends StatefulWidget {
  final Function onCarAdded;
  final CarModel? car;
  final int? index;

  const AddCarView({super.key, required this.onCarAdded, this.car, this.index});

  @override
  State<AddCarView> createState() => _AddCarViewState();
}

class _AddCarViewState extends State<AddCarView> {
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final yearController = TextEditingController();
  final CarController carController = CarController();

  @override
  void initState() {
    super.initState();
    if (widget.car != null) {
      makeController.text = widget.car!.make;
      modelController.text = widget.car!.model;
      yearController.text = widget.car!.year.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.car == null ? 'Add Car' : 'Edit Car')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: makeController,
              decoration: const InputDecoration(labelText: 'Make'),
            ),
            TextField(
              controller: modelController,
              decoration: const InputDecoration(labelText: 'Model'),
            ),
            TextField(
                controller: yearController,
                decoration: const InputDecoration(labelText: 'Year'),
                keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var car = CarModel(
                  make: makeController.text,
                  model: modelController.text,
                  year: int.parse(yearController.text),
                );

                if (widget.car == null) {
                  carController.addCar(car);
                } else {
                  carController.updateCar(widget.index!, car);
                }

                widget.onCarAdded();
                Navigator.pop(context);
              },
              child: Text(widget.car == null ? 'Add Car' : 'Update Car'),
            ),
          ],
        ),
      ),
    );
  }
}

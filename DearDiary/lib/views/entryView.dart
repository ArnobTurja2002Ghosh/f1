import 'package:flutter/material.dart';

import '../controllers/car_controller.dart';
import '../models/car_model.dart';

class EntryView extends StatefulWidget {
  int? replacingIndex;
  EntryView({super.key, this.replacingIndex});

  @override
  State<EntryView> createState() => _EntryViewState();
}

class _EntryViewState extends State<EntryView> {
  double _currentSliderValue = 3;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final CarController carController = CarController();

  @override
  void initState() {
    super.initState();
    if (widget.replacingIndex != null) {
      var car1 = carController.getAllCars()[widget.replacingIndex!];
      _dateController.text = car1.date;
      _descriptionController.text = car1.description;
      _currentSliderValue = car1.rate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add diary Entry")),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Description"),
          TextField(
            maxLength: 140,
            controller: _descriptionController,
            decoration: InputDecoration(
                helperText: "Describe your day in 140 characters"),
          ),
          Row(
            children: [
              Text("Rate your day:"),
              Slider(
                  value: _currentSliderValue,
                  max: 5,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  }),
            ],
          ),
          TextField(
            controller: _dateController,
            style: TextStyle(
                color: _dateController.text == 'required'
                    ? Colors.red
                    : Colors.black),
            decoration: InputDecoration(
              //filled: true,
              prefixText: "Date: ",
              suffixIcon: const Icon(Icons.calendar_today),
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
            ),
            readOnly: true,
            onTap: () {
              _selectDate();
            },
          ),
          ElevatedButton(
              onPressed: () {
                var car = CarModel(
                  description: _descriptionController.text,
                  rate: _currentSliderValue,
                  date: _dateController.text,
                );
                if (DateTime.tryParse(car.date) == null) {
                  setState(() {
                    _dateController.text = "required";
                  });
                } else if (_descriptionController.text == "") {
                  setState(() {
                    _descriptionController.text = "null description";
                  });
                } else if (carController
                        .getAllCars()
                        .any((person) => person.date == car.date) &&
                    widget.replacingIndex == null) {
                  SnackBar snackBar = SnackBar(
                    content:
                        const Text('An entry already exists for this date'),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (widget.replacingIndex != null) {
                  carController.updateCar(widget.replacingIndex!, car);
                  Navigator.pop(context);
                } else {
                  setState(() {
                    carController.addCar(car);
                    Navigator.pop(context);
                  });
                  print("hopefully added ");
                }
              },
              child: Text("Save Entry"))
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}

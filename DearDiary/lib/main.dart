import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

import '../controllers/car_controller.dart';
import 'models/car_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CarModelAdapter());
  await Hive.openBox<CarModel>('cars_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CarController carController = CarController();
  String dropdownValue = '';
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var cars1 = carController.getAllCars();

    cars1.sort(
        (a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));
    List<Icon> _star(double count2) {
      return List.generate(
          5,
          (i) => Icon(
                Icons.star,
                color: i < count2 ? Colors.blue : Colors.grey,
              )).toList(); // replace * with your rupee or use Icon instead
    }

    List<String> monthsInAYear = [
      '',
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    var cars = cars1.where((element) {
      return monthsInAYear[DateTime.parse(element.date).month] ==
              dropdownValue ||
          dropdownValue == '';
    }).toList();
    List<String> daysInAWeek = [
      '',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.grey,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: Text("Diary Entries")),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EntryView(),
                      )).then((val) {
                    setState(() {});
                  });
                },
                child: Text("+"))
          ],
        ),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            items: monthsInAYear.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            value: dropdownValue,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                print("inserting $index");
                var car = cars[index];
                return ListTile(
                  title: Column(children: () {
                    return [
                      if (index == 0) ...[
                        ElevatedButton(
                          onPressed: () {
                            DiaryPDFExporter.generatePDF(cars);
                          },
                          child: Text("Download as PDF"),
                        ),
                        Text(
                            '${monthsInAYear[DateTime.parse(car.date).month]} ${DateTime.parse(car.date).year}'),
                      ] else if (DateTime.parse(car.date).month !=
                          DateTime.parse(cars[index - 1].date).month)
                        Text(
                            '${monthsInAYear[DateTime.parse(car.date).month]} ${DateTime.parse(car.date).year}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                              "${daysInAWeek[DateTime.parse(car.date).weekday]}, ${monthsInAYear[DateTime.parse(car.date).month]} ${DateTime.parse(car.date).day}"),
                          Row(children: _star(car.rate)),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              for (int i = 0;
                                  i < carController.getAllCars().length;
                                  i++) {
                                if (carController.getAllCars()[i] == car) {
                                  print(i);
                                  setState(() {
                                    carController.deleteCar(i);
                                  });
                                }
                              }
                            },
                          ),
                        ],
                      ),
                      InkWell(
                        onLongPress: () {
                          print("zor se dabayaaaa");
                          for (int i = 0;
                              i < carController.getAllCars().length;
                              i++) {
                            if (carController.getAllCars()[i] == car) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EntryView(
                                      replacingIndex: i,
                                    ),
                                  )).then((val) {
                                setState(() {});
                              });
                            }
                          }
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(car.description),
                        ),
                      )
                    ];
                  }()),
                );
                //trailing: Row(mainAxisSize: MainAxisSize.min));
              },
            ),
          ),
        ],
      ),
      // Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     // Column is also a layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     //
      //     // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
      //     // action in the IDE, or press "p" in the console), to see the
      //     // wireframe for each widget.
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         '${DateTime.now().day} ${[
      //           "January",
      //           "February",
      //           "March",
      //           "April",
      //           "May",
      //           "June",
      //           "July",
      //           "August",
      //           "September",
      //           "October",
      //           "November",
      //           "December"
      //         ][DateTime.now().month - 1]} ${DateTime.now().year}',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DiaryPDFExporter {
  static Future<void> generatePDF(List<CarModel> entries) async {
    List<String> monthsInAYear = [
      '',
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    List<String> daysInAWeek = [
      '',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: entries
              .mapIndexed((i, entry) => pw.Column(children: [
                    if (i == 0 ||
                        DateTime.parse(entry.date).month !=
                            DateTime.parse(entries[i - 1].date).month)
                      pw.Text(
                          '${monthsInAYear[DateTime.parse(entry.date).month]} ${DateTime.parse(entry.date).year}'),
                    pw.Text(
                        "${daysInAWeek[DateTime.parse(entry.date).weekday]}, ${monthsInAYear[DateTime.parse(entry.date).month]} ${DateTime.parse(entry.date).day}"),
                    pw.Align(
                        alignment: pw.Alignment.topLeft,
                        child: pw.Text(entry.description))
                  ]))
              .toList(),
        ),
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/diary_entries.pdf';
    final file = File(filePath);

    await file.writeAsBytes(await pdf.save());
    OpenFile.open(filePath);
  }
}

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

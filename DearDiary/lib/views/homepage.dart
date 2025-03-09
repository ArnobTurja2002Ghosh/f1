import 'package:flutter/material.dart';

import '../controllers/car_controller.dart';
import '../controllers/pdfExporter.dart';
import './entryView.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MeanView()))
                      .then((val) {
                    setState(() {});
                  });
                },
                child: Text("Mean Ratings"),
              ),
            ],
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MeanView extends StatelessWidget {
  MeanView({super.key});

  @override
  Widget build(BuildContext context) {
    final CarController carController = CarController();
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
    var cars = cars1;
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
        title: Text("Average rating for every month"),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          print("inserting $index");
          var car = cars[index];
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: () {
                return [
                  if (index == 0 ||
                      DateTime.parse(car.date).month !=
                          DateTime.parse(cars[index - 1].date).month) ...[
                    Text(
                      '${monthsInAYear[DateTime.parse(car.date).month]} ${DateTime.parse(car.date).year}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                        children: _star(cars
                                .where((test) {
                                  return DateTime.parse(test.date).month ==
                                      DateTime.parse(car.date).month;
                                })
                                .toList()
                                .map((toElement) {
                                  return toElement.rate;
                                })
                                .reduce((a, b) => a + b) /
                            cars.where((test) {
                              return DateTime.parse(test.date).month ==
                                  DateTime.parse(car.date).month;
                            }).length)),
                  ],
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Text(
                  //         "${daysInAWeek[DateTime.parse(car.date).weekday]}, ${monthsInAYear[DateTime.parse(car.date).month]} ${DateTime.parse(car.date).day}"),
                  //     Row(children: _star(car.rate)),
                  //   ],
                  // ),
                  // InkWell(
                  //   onLongPress: () {
                  //     print("zor se dabayaaaa");
                  //     for (int i = 0;
                  //     i < carController.getAllCars().length;
                  //     i++) {
                  //       if (carController.getAllCars()[i] == car) {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => EntryView(
                  //                 replacingIndex: i,
                  //               ),
                  //             )).then((val) {
                  //           setState(() {});
                  //         });
                  //       }
                  //     }
                  //   },
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Text(car.description),
                  //   ),
                  // )
                ];
              }());
          //trailing: Row(mainAxisSize: MainAxisSize.min));
        },
      ),
    );
  }
}

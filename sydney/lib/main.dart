import 'package:flutter/material.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
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
    return Scaffold(
      // appBar: AppBar(
      //   // TRY THIS: Try changing the color here to a specific color (to
      //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
      //   // change color while the other colors stay the same.
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Container(
          //height: MediaQuery.of(context).size.height,
          //width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1549180030-48bf079fb38a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3lkbmV5fGVufDB8fDB8fHww"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Welcome to Sydney",
                  style: TextStyle(
                    fontSize: 70,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchedScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal),
                  child: Center(
                      child: Text(
                    "Explore itineraries",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )),
                ),
              )
            ],
          )),
    );
  }
}

class SearchedScreen extends StatelessWidget {
  const SearchedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Itinerary",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                            "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/38/6c/09/20171001-141954-largejpg.jpg"))),
                child: Text(
                  "adventure enthusiasts",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      backgroundColor: Color(0x99000000)),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(
                              "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjbyzPdkSVkTsfgMLns31uveOJxhSJ5I4Xyt_ZgaZQb9M-JHTgatZ-TKfMlx7W_CmrfdS1oQQFSqpWhmzvxoV5H2efclQE-DPwxdsXrtFnexcko7pkn1zsHcVYxV50E3PLkUhfqtLfrlI0g/s400/DSC00201+%25286%2529.JPG"))),
                  child: Text(
                    "culinary seekers",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        backgroundColor: Color(0x99000000)),
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                            "https://www.historyhit.com/app/uploads/2020/11/Bennelong-Point.jpg"))),
                child: Text(
                  "history aficionados",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      backgroundColor: Color(0x99000000)),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(
                              "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/47/12/e1/lord-nelson-hotel-brewery.jpg?w=900&h=500&s=1"))),
                  child: Text(
                    "nightlife revelers",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        backgroundColor: Color(0x99000000)),
                    textAlign: TextAlign.center,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'app_text.dart';

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
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/images/photo.jpg"))),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      width: 120,
                      decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(10),
                          color: Colors.teal),
                      child: Center(
                          child: Text(
                        "Explore",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Aditya(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(10),
                          color: Colors.teal),
                      child: Center(
                          child: Text(
                        "itineraries",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )),
                    ),
                  )
                ],
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdventureScreen(
                        images: AppText.adventureImages,
                        textBodies: AppText.adventureTexts,
                        textTitles: AppText.adventureTitles,
                        appBarTitle: "Adventure Enthusiasts",
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("assets/images/NSW.webp"))),
                  alignment: Alignment(0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    color: Color(0x99000000),
                    child: Text(
                      "adventure enthusiasts",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        //backgroundColor: Color(0x99000000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdventureScreen(
                        images: AppTexts.adventureImages,
                        textBodies: AppTexts.adventureTexts,
                        textTitles: AppTexts.adventureTitles,
                        appBarTitle: "Culinary Seekers",
                      ),
                    ),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage("assets/images/sw.jpg"))),
                    alignment: Alignment(0, 0),
                    child: Container(
                      color: Color(0x99000000),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "culinary seekers",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          //backgroundColor: Color(0x99000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdventureScreen(
                        images: AppTextss.adventureImages,
                        textBodies: AppTextss.adventureTexts,
                        textTitles: AppTextss.adventureTitles,
                        appBarTitle: "History Aficionados",
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("assets/images/174449-2.webp"))),
                  alignment: Alignment(0, 0),
                  child: Container(
                    color: Color(0x99000000),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      "history aficionados",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        //backgroundColor: Color(0x99000000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdventureScreen(
                        images: AppTextsss.adventureImages,
                        textBodies: AppTextsss.adventureTexts,
                        textTitles: AppTextsss.adventureTitles,
                        appBarTitle: "Nightlife Revelers",
                      ),
                    ),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(
                                "assets/images/lord-nelson-hotel-brewery.jpg"))),
                    alignment: Alignment(0, 0),
                    child: Container(
                      color: Color(0x99000000),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "nightlife revelers",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          //backgroundColor: Color(0x99000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AdventureScreen extends StatelessWidget {
  final String appBarTitle;
  final List<String> images, textTitles, textBodies;
  const AdventureScreen(
      {super.key,
      required this.appBarTitle,
      required this.images,
      required this.textTitles,
      required this.textBodies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.tealAccent,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.bottomCenter,
                            image:
                                AssetImage("assets/images/${images[index]}"))),
                  ),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        children: [
                          Text(
                            textTitles[index],
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            textBodies[index],
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class Aditya extends StatelessWidget {
  const Aditya({super.key});
  Widget createItem(String text, String image, BuildContext context, List l1) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdventureScreen(
                images: l1[0],
                textBodies: l1[1],
                textTitles: l1[2],
                appBarTitle: l1[3],
              ),
            ),
          );
        },
        child: Container(
          //width: MediaQuery.of(context).size.width / 2,
          //height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/images/$image"))),
          alignment: Alignment(0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            color: Color(0x99000000),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                //backgroundColor: Color(0x99000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        createItem('adventure enthusiasts', "NSW.webp", context, [
          AppText.adventureImages,
          AppText.adventureTexts,
          AppText.adventureTitles,
          "Adventure Enthusiasts"
        ]),
        createItem('culinary seekers', "sw.jpg", context, [
          AppTexts.adventureImages,
          AppTexts.adventureTexts,
          AppTexts.adventureTitles,
          "Culinary Seekers"
        ]),
        createItem('history aficionados', "174449-2.webp", context, [
          AppTextss.adventureImages,
          AppTextss.adventureTexts,
          AppTextss.adventureTitles,
          "History Aficionados"
        ]),
        createItem(
            'nightlife revelers', "lord-nelson-hotel-brewery.jpg", context, [
          AppTextsss.adventureImages,
          AppTextsss.adventureTexts,
          AppTextsss.adventureTitles,
          "Nightlife Revelers"
        ])
      ],
    );
  }
}

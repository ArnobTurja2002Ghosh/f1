import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class FirstPassword extends ChangeNotifier
{
  String firstPassword ="";

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

class MyHomePage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    TextEditingController c1=TextEditingController();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

           Padding(padding: EdgeInsets.fromLTRB(50, 50, 50, 50), child:
           Column(children: [TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter Email'
              ),
              
              ),
              TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter Password', 
                
              ),
              obscureText: true,
              controller: c1,
              ),
              

              SignInUp(firstPassword: c1)
              ],
              
              )
           
            
              
            ),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

class SignInUp extends StatefulWidget {
  final TextEditingController firstPassword;
  const SignInUp({
    super.key, required this.firstPassword
  });

  @override
  State<SignInUp> createState() => _SignInUpState();
}

class _SignInUpState extends State<SignInUp> {
  
  String state = "in";
  @override
  Widget build(BuildContext context) {
    if(state=="in")
    {
      return Column(children: [
        Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20), child: OutlinedButton(onPressed: ()=>{}, child: Text("Sign in"))
        ,),
        Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child: Row(children:[Text("Don't have an account? "), TextButton(onPressed: (){
          setState(() {
          state="up";
          }
          );}, child: Text("Sign up"))] ,),
        ), 

      ]);
      
    }
    else if(state=="up")
    {
      final formKey = GlobalKey<FormState>();
      return Column(children: [
        Form(key: formKey,
          child: 
          TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Confirm Password', 
              ),
              obscureText: true,
              
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                else if(value!=widget.firstPassword.text)
                {
                  return "Initial and confirmed passwords do not match";
                }
                return null;
              },
              onFieldSubmitted: (value) {
                if(widget.firstPassword.text!=value)
                {
                  print("first password is ${widget.firstPassword.text}");
                  print("confirmed password is $value");
                }
                print(formKey.currentState.toString());
                if(formKey.currentState!.validate()){
                  print("validating");
                }
              },
              ),
        ),
        
        Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20), child: OutlinedButton(
          onPressed: (){
            
          }, child: Text("Sign up"))
        ,),
        Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child: Row(children:[Text("Already have an account? "), TextButton(onPressed: (){
          setState(() {
          state="in";
          }
          );
        }, child: Text("Sign in"))] ,),
        ),
      ],);
    }
    else{return Text("Something wrong");}
  }
}

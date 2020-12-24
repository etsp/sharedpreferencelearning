import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferencelearning/ui/sharepreference/shared.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MyNameUpdate.route : (context) => MyNameUpdate(),
      },
      home: Hello(),
    );
  }
}

class Hello extends StatefulWidget {
  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  int myValue;
  String myName;

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myValue = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $myValue times.');
    await prefs.setInt('counter', myValue);
    setState(() {});
  }

  getLastValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myValue = prefs.getInt('counter');
    myName = prefs.getString('myName');
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLastValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(onPressed: () {
              print("");
              _incrementCounter();
              setState(() {});
            }),

            Text(myValue.toString()),
            Text(myName.toString()),
            RaisedButton(onPressed: (){
              Navigator.of(context).pushNamed(MyNameUpdate.route);
            })
          ],
        ),
      ),
    );
  }
}

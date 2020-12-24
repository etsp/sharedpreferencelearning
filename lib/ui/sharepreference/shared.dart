import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyNameUpdate extends StatefulWidget {
  static String route ="MyNameUpdate";
  @override
  _MyNameUpdateState createState() => _MyNameUpdateState();
}

class _MyNameUpdateState extends State<MyNameUpdate> {
  TextEditingController nameController = TextEditingController();

  updateName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('myName', nameController.text);
    nameController.text = prefs.getString('myName');
    print('Pressed ${nameController.text} times.');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
          ),
          nameController.text == null ||  nameController.text == ""
              ? Text("Write and Update Your Name")
              : Text(nameController.text),
          RaisedButton(onPressed: (){
            updateName();
          })
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var students = ["student1", "student2", "student3", "student4"];
    return Scaffold(
      appBar: AppBar(
        title: const Text("My flutter App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(students[index]);
                }),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  //functions call
                  String msg = statusMessage(55);
                  displayMessage(context, msg);
                },
                child: const Text('Press Button')),
          ),
        ],
      ),
    );
  }

  //Functions
  String statusMessage(int not) {
    String msg = '';
    if (not >= 50) {
      msg = "High Level";
    } else if (not >= 40) {
      msg = "Middle Level";
    } else {
      msg = "Low Level";
    }
    return msg;
  }

  void displayMessage(BuildContext context, msg) {
    var alert = AlertDialog(
      title: const Text("Result"),
      content: Text(msg),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}

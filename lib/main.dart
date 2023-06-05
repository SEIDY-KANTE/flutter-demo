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
    return Scaffold(
      appBar: AppBar(
        title: const Text("My flutter App"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              var alert = const AlertDialog(
                title: Text("Result"),
                content: Text("Super"),
              );

              showDialog(
                  context: context, builder: (BuildContext context) => alert);
            },
            child: const Text('Press Button')),
      ),
    );
  }
}

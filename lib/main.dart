import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("My flutter App"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          var alert=const AlertDialog(
            title: Text("Result"),
            content: Text("Super"),
          );
        }, child: const Text('Press Button')),
      ),
    ),
  ));
}

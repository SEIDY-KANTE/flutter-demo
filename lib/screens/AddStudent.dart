import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget{
  const AddStudent({super.key});

  @override
  State<AddStudent> createState()=>_AddStudent();
}

class _AddStudent extends State<AddStudent>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title:const Text("Add Student Page"),
      ),
      body:const Center(
        child: Text("Student will adding here"),
      ),
    );
  }
}
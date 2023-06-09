import 'package:demo/models/student.dart';
import 'package:flutter/material.dart';

import '../validation/my_validator.dart';

class AddStudent extends StatefulWidget {
  List<Student> students;
  AddStudent(this.students, {super.key});

  @override
  State<AddStudent> createState() => _AddStudent(students);
}

class _AddStudent extends State<AddStudent> with ValidatorMixin {
  List<Student> students;
  _AddStudent(this.students);

  var student = Student.withoutInfo();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Student Page"),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person_add),
                    labelText: "Student First Name",
                    hintText: "Seidy",
                  ),
                  validator: firstNameValidator,
                  onSaved: (firstName) {
                    student.firstName = firstName.toString();
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person_add_alt_1),
                    labelText: "Student Last Name",
                    hintText: "Kanté",
                  ),
                  validator: lastNameValidator,
                  onSaved: (lastName) {
                    student.lastName = lastName!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.grade),
                    labelText: "Student Grade",
                    hintText: "0-100",
                  ),
                  validator: gradeValidator,
                  onSaved: (grade) {
                    student.grade = int.parse(grade!);
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Form is valid...");
                      }
                    },
                    child: const Text('Save'))
              ],
            ),
          ),
        ));
  }
}
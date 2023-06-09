import 'package:demo/models/student.dart';
import 'package:demo/validation/my_validator.dart';
import 'package:flutter/material.dart';

class UpdateStudent extends StatefulWidget {
  final Student selectedStudent;
  const UpdateStudent(this.selectedStudent, {super.key});

  @override
  State<StatefulWidget> createState() => _UpdateStudent(selectedStudent);
}

class _UpdateStudent extends State<UpdateStudent> with ValidatorMixin {
  Student selectedStudent;
  _UpdateStudent(this.selectedStudent);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update Student Page"),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                buildFirstName(),
                buildLastName(),
                buildStudentGrade(),
                submitButton(),
              ],
            ),
          ),
        ));
  }

  Widget buildFirstName() {
    return TextFormField(
      initialValue: selectedStudent.firstName,
      decoration: const InputDecoration(
        icon: Icon(Icons.person_add),
        labelText: "Student First Name",
        hintText: "Seidy",
      ),
      validator: firstNameValidator,
      onSaved: (firstName) {
        selectedStudent.firstName = firstName.toString();
      },
    );
  }

  Widget buildLastName() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: const InputDecoration(
        icon: Icon(Icons.person_add_alt_1),
        labelText: "Student Last Name",
        hintText: "Kanté",
      ),
      validator: lastNameValidator,
      onSaved: (lastName) {
        selectedStudent.lastName = lastName!;
      },
    );
  }

  Widget buildStudentGrade() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: const InputDecoration(
        icon: Icon(Icons.grade),
        labelText: "Student Grade",
        hintText: "0-100",
      ),
      validator: gradeValidator,
      onSaved: (grade) {
        selectedStudent.grade = int.parse(grade!);
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            Navigator.pop(context, true);
          }
        },
        child: const Text('Update'));
  }
}

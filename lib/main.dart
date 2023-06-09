import 'package:demo/models/student.dart';
import 'package:demo/screens/add_student.dart';
import 'package:demo/screens/update_student.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Student> students = [
    Student("Seidy", "Kante", 80),
    Student("Oumar", "Sacko", 45),
    Student("Amir", "Kenth", 38)
  ];

  Student selectedStudent = Student.withoutInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Management System DEMO"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index].imageSrc),
                    ),
                    title: Text(
                        "${students[index].firstName} ${students[index].lastName}"),
                    subtitle: Text(
                        "Grade from exam: ${students[index].grade} [${students[index].getStatus}]"),
                    trailing: displayStatusIcon(students[index].grade),
                    onTap: () {
                      //print("${students[index].firstName} ${students[index].lastName}");

                      setState(() {
                        selectedStudent = students[index];
                      });
                    },
                  );
                }),
          ),
          Text("Selected Student: ${selectedStudent.firstName}"),
          Row(
            children: [
              addStudentFlexible(),
              updateStudentFlexible(),
              deleteStudentFlexible(),
            ],
          ),
        ],
      ),
    );
  }

  //========Flexible===============

  Widget addStudentFlexible() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: ElevatedButton(
        onPressed: () {
          //Adding Implementation
          Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => AddStudent(students)))
              .then((value) => {
                    //Refreshing
                    setState(() {
                      selectedStudent = students[students.length - 1];
                    })
                  });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
        ),
        child: const Row(
          children: [
            Icon(Icons.add),
            SizedBox(
              width: 5,
            ),
            Text("Add"),
          ],
        ),
      ),
    );
  }

  Widget updateStudentFlexible() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: ElevatedButton(
          onPressed: () {
            //Updating Implementation
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => UpdateStudent(selectedStudent))
            ).then((value) => {
              //refreshing
              setState((){
                //selectedStudent=students[students.length-1];
              })
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey, foregroundColor: Colors.black),
          child: const Row(
            children: [
              Icon(Icons.update),
              SizedBox(
                width: 5,
              ),
              Text("Update"),
            ],
          )),
    );
  }

  Widget deleteStudentFlexible() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: ElevatedButton(
        onPressed: () {
          //Delete Implementation
          setState(() {
            students.remove(selectedStudent);
          });
          var alert = AlertDialog(
            title: const Text("Process"),
            content: Text("${selectedStudent.firstName} has been Deleted"),
          );
          showDialog(context: context, builder: (builder) => alert);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, foregroundColor: Colors.black),
        child: const Row(
          children: [
            Icon(Icons.delete),
            SizedBox(
              width: 5,
            ),
            Text("Delete"),
          ],
        ),
      ),
    );
  }

  //Functions
  Widget displayStatusIcon(int grade) {
    if (grade >= 50) {
      return const Icon(Icons.done);
    } else if (grade >= 40) {
      return const Icon(Icons.adjust_rounded);
    } else {
      return const Icon(Icons.clear);
    }
  }
}

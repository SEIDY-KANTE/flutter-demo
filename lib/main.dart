import 'package:demo/models/Student.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}



class MyApp extends StatefulWidget{
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

  String selectedStudent = 'xStd';

  @override
  Widget build(BuildContext context) {

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
                        selectedStudent =
                        "${students[index].firstName} ${students[index].lastName}";
                      });

                    },
                  );
                }),
          ),
          Text("Selected Student: $selectedStudent"),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  //functions call
                  //String msg = statusMessage(55);
                  //displayMessage(context, msg);
                },
                child: const Text('Press Button')),
          ),
        ],
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

import 'package:demo/models/Student.dart';
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
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    //Adding Implementation
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Background color
                      onPrimary: Colors.black //Text color (Foreground color)
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
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                    onPressed: () {
                      //Updating Implementation
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey, onPrimary: Colors.black),
                    child: const Row(
                      children: [
                        Icon(Icons.update),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Update"),
                      ],
                    )),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    //Delete Implementation
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red, onPrimary: Colors.black),
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
              )
            ],
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

import 'package:flutter/material.dart';
import '../data/student_data.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<bool> present = [];

  @override
  void initState() {
    present = List.generate(students.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),

      body: ListView.builder(
        itemCount: students.length,

        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(students[index].name),

            subtitle: Text(students[index].rollNo),

            value: present[index],

            onChanged: (value) {
              setState(() {
                present[index] = value!;
              });
            },
          );
        },
      ),
    );
  }
}

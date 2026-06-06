import 'package:flutter/material.dart';
import '../data/student_data.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Report")),

      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text("Roll No")),

            DataColumn(label: Text("Name")),

            DataColumn(label: Text("Branch")),
          ],

          rows: students.map((student) {
            return DataRow(
              cells: [
                DataCell(Text(student.rollNo)),

                DataCell(Text(student.name)),

                DataCell(Text(student.branch)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../data/student_data.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Statistics")),

      body: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text("Total Students"),
              subtitle: Text(students.length.toString()),
            ),
          ),
        ],
      ),
    );
  }
}

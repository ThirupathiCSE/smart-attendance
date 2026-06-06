import 'package:flutter/material.dart';
import '../data/student_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    var filtered = students.where((s) => s.rollNo.contains(query)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Search Student")),

      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Enter Roll No"),
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (c, i) {
                return ListTile(
                  title: Text(filtered[i].name),
                  subtitle: Text(filtered[i].rollNo),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

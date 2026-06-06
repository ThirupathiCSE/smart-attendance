import 'package:flutter/material.dart';
import '../models/student.dart';
import '../data/student_data.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final rollController = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();

  String? selectedBranch;
  String? selectedSection;
  String? selectedSemester;
  String? selectedAcademicYear;

  DateTime? selectedDate;

  List<String> branches = [
    "CSE",
    "CSE-AIML",
    "CSE-DS",
    "IT",
    "ECE",
    "EEE",
    "MECH",
    "CIVIL",
  ];

  List<String> sections = ["A", "B", "C", "D", "E", "F", "G"];

  List<String> semesters = [
    "I-I",
    "I-II",
    "II-I",
    "II-II",
    "III-I",
    "III-II",
    "IV-I",
    "IV-II",
  ];

  List<String> academicYears = ["2025-26", "2026-27", "2027-28", "2028-29"];

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void registerStudent() {
    if (_formKey.currentState!.validate()) {
      Student student = Student(
        rollNo: rollController.text.trim(),
        name: nameController.text.trim(),
        branch: selectedBranch!,
        section: selectedSection!,
        mobile: mobileController.text.trim(),
        email: emailController.text.trim(),
        semester: selectedSemester!,
        academicYear: selectedAcademicYear!,
      );

      students.add(student);

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Registration Successful"),
          content: Text(
            "Student Registered Successfully\n\n"
            "Name : ${student.name}\n"
            "Roll No : ${student.rollNo}\n"
            "Branch : ${student.branch}\n"
            "Section : ${student.section}",
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                clearForm();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  void clearForm() {
    rollController.clear();
    nameController.clear();
    mobileController.clear();
    emailController.clear();

    setState(() {
      selectedBranch = null;
      selectedSection = null;
      selectedSemester = null;
      selectedAcademicYear = null;
      selectedDate = null;
    });
  }

  @override
  void dispose() {
    rollController.dispose();
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Registration"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                child: Icon(Icons.person_add, size: 40),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: rollController,
                decoration: const InputDecoration(
                  labelText: "Roll Number",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.badge),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter Roll Number";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Student Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter Student Name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: selectedBranch,
                decoration: const InputDecoration(
                  labelText: "Branch",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.school),
                ),
                items: branches
                    .map(
                      (branch) =>
                          DropdownMenuItem(value: branch, child: Text(branch)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedBranch = value;
                  });
                },
                validator: (value) => value == null ? "Select Branch" : null,
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: selectedSection,
                decoration: const InputDecoration(
                  labelText: "Section",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.groups),
                ),
                items: sections
                    .map(
                      (section) => DropdownMenuItem(
                        value: section,
                        child: Text(section),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSection = value;
                  });
                },
                validator: (value) => value == null ? "Select Section" : null,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Mobile Number",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Mobile Number";
                  }

                  if (value.length != 10) {
                    return "Mobile Number must be 10 digits";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email ID",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Email ID";
                  }

                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                  ).hasMatch(value)) {
                    return "Enter Valid Email";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: selectedSemester,
                decoration: const InputDecoration(
                  labelText: "Semester",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.menu_book),
                ),
                items: semesters
                    .map(
                      (semester) => DropdownMenuItem(
                        value: semester,
                        child: Text(semester),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSemester = value;
                  });
                },
                validator: (value) => value == null ? "Select Semester" : null,
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: selectedAcademicYear,
                decoration: const InputDecoration(
                  labelText: "Academic Year",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                items: academicYears
                    .map(
                      (year) =>
                          DropdownMenuItem(value: year, child: Text(year)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedAcademicYear = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Select Academic Year" : null,
              ),

              const SizedBox(height: 15),

              ListTile(
                tileColor: Colors.blue.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(
                  selectedDate == null
                      ? "Select Admission Date"
                      : "Admission Date : "
                            "${selectedDate!.day}/"
                            "${selectedDate!.month}/"
                            "${selectedDate!.year}",
                ),
                trailing: const Icon(Icons.date_range),
                onTap: pickDate,
              ),

              const SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: clearForm,
                      icon: const Icon(Icons.refresh),
                      label: const Text("Reset"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: registerStudent,
                      icon: const Icon(Icons.save),
                      label: const Text("Register"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

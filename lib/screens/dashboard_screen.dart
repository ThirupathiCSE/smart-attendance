import 'package:flutter/material.dart';

import 'registration_screen.dart';
import 'attendance_screen.dart';
import 'report_screen.dart';
import 'search_screen.dart';
import 'statistics_screen.dart';

import '../widgets/dashboard_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance Dashboard")),

      body: GridView.count(
        crossAxisCount: 2,
        children: [
          dashboardButton(context, Icons.person_add, "Add Student", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RegistrationScreen()),
            );
          }),

          dashboardButton(context, Icons.how_to_reg, "Attendance", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AttendanceScreen()),
            );
          }),

          dashboardButton(context, Icons.search, "Search", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SearchScreen()),
            );
          }),

          dashboardButton(context, Icons.list_alt, "Reports", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ReportScreen()),
            );
          }),

          dashboardButton(context, Icons.bar_chart, "Statistics", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const StatisticsScreen()),
            );
          }),
        ],
      ),
    );
  }
}

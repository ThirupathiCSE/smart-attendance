import 'package:flutter/material.dart';

Widget dashboardButton(
  BuildContext context,
  IconData icon,
  String title,
  VoidCallback onTap,
) {
  return Card(
    elevation: 5,
    child: InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50),

          const SizedBox(height: 10),

          Text(title),
        ],
      ),
    ),
  );
}

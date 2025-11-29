// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 93, 155),
        automaticallyImplyLeading: false, // Remove default back button
        title: const Text('الإشعارات'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Pop the current screen to go back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: List.generate(10, (index) {
            return NotificationCard(
              title: "Notification ${index + 1}",
              message:
                  "This is the message for notification number ${index + 1}.",
              date: "2025-11-29",
            );
          }),
        ),
      ),
    );
  }
}

// Custom widget for displaying individual notifications
class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String date;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            const SizedBox(height: 8),
            Text(
              date,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}

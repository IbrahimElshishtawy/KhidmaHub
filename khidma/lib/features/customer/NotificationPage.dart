// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildAppBar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildAppBar(
                isSearching: false,
                searchController: TextEditingController(),
                onSearchToggle: (bool isSearching) {},
                onSearchChanged: (String query) {},
                isNotificationPage: true,
                context:
                    context, // Set the flag to true to hide the back button
              )
              as PreferredSizeWidget,
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
    Key? key,
    required this.title,
    required this.message,
    required this.date,
  }) : super(key: key);

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

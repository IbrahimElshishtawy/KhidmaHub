// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khidma/features/customer/NotificationPage.dart';

// Building the app bar, no back button for the Notifications page
Widget buildAppBar({
  required BuildContext context,
  required bool isSearching,
  required TextEditingController searchController,
  required Function(bool) onSearchToggle,
  required void Function(String query) onSearchChanged,
  bool isNotificationPage = false, // Check if the page is for notifications
}) {
  return AppBar(
    backgroundColor: const Color(0xFF3B5998),
    automaticallyImplyLeading:
        !isNotificationPage, // Remove back button for Notifications page
    title: isSearching
        ? TextField(
            controller: searchController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'ابحث عن خدمة...',
              hintStyle: TextStyle(color: Colors.white70),
              border: InputBorder.none,
            ),
          )
        : const Text('الخدمات'),
    actions: [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          onSearchToggle(!isSearching);
        },
      ),
      IconButton(
        icon: const Icon(Icons.notifications_none),
        onPressed: () {
          // Navigate to Notifications Page when clicked
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationPage()),
          );
        },
      ),
    ],
  );
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khidma/features/customer/NotificationPage.dart';

Widget buildAppBar({
  required BuildContext context,
  required bool isSearching,
  required TextEditingController searchController,
  required Function(bool) onSearchToggle,
  required void Function(String query) onSearchChanged,
  bool isNotificationPage = false, // Check if the page is for notifications
}) {
  return AppBar(
    backgroundColor: const Color.fromARGB(
      255,
      255,
      255,
      255,
    ), // Keeping the original color
    automaticallyImplyLeading:
        false, // Remove back button for Notifications page

    elevation: 1, // Add elevation for a material design feel
    title: isSearching
        ? AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: TextField(
              controller: searchController,
              style: const TextStyle(color: Colors.white),
              onChanged: onSearchChanged,
              decoration: const InputDecoration(
                hintText: 'ابحث عن خدمة...',
                hintStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                border: InputBorder.none,
              ),
            ),
          )
        : const Text(
            'الخدمات',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ), // Styled title
          ),
    actions: [
      // Search Button with Animation on Press
      AnimatedOpacity(
        opacity: isSearching ? 0.5 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            onSearchToggle(!isSearching); // Toggle search mode
          },
        ),
      ),

      // Notification Button
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

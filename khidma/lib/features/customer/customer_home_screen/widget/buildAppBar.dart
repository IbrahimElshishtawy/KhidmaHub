// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget buildAppBar({
  required bool isSearching,
  required TextEditingController searchController,
  required Function(bool) onSearchToggle,
  required void Function(String query) onSearchChanged,
}) {
  return AppBar(
    backgroundColor: const Color(0xFF3B5998),
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
          // تنفيذ الكود الخاص بالإشعارات
        },
      ),
    ],
  );
}

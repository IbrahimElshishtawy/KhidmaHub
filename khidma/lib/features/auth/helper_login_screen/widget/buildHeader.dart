// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

Widget buildHeader(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 8),
          Text(
            "خدمة",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white.withOpacity(0.95),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Text(
        "سجّل كمساعد وابدأ في استقبال الطلبات بسهولة",
        style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
      ),
    ],
  );
}

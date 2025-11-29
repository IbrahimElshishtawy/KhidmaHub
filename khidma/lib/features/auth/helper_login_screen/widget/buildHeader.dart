// ignore_for_file: deprecated_member_use

// Header
import 'package:flutter/material.dart';

Widget buildHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "خدمة",
        style: TextStyle(
          fontSize: 30,
          color: Colors.white.withOpacity(0.95),
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        "سجّل كمساعد وابدأ في استقبال الطلبات بسهولة",
        style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
      ),
    ],
  );
}

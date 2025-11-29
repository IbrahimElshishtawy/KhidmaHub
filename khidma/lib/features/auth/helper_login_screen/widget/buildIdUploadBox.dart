// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

Widget buildIdUploadBox() {
  return Container(
    height: 110,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFFE0E0E0)),
      color: Colors.white.withOpacity(0.55),
    ),
    child: Row(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xFFE8F0FF),
          ),
          child: const Icon(
            Icons.badge_outlined,
            size: 28,
            color: Color(0xFF0066FF),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "إرفاق الهوية (Mock UI فقط)",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 3),
              Text(
                "قم برفع صورة الهوية أو الإقامة للتحقق من حسابك.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

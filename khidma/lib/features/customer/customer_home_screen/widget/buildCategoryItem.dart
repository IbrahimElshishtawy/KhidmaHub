// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';

Widget buildCategoryItem(String title, IconData icon) {
  return GestureDetector(
    onTap: () {
      // هنا يمكنك إضافة أكواد لتغيير الشاشة أو تنفيذ أفعال عند الضغط
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF), // خلفية المربع
        borderRadius: BorderRadius.circular(16), // تدوير الزوايا
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15), // الظلال الخفيفة
            blurRadius: 10, // زيادة تأثير الظلال
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50, // تكبير الأيقونة لإعطائها مزيدًا من الأهمية
            color: const Color(0xFF3B5998), // تخصيص اللون للأيقونة
          ),
          const SizedBox(height: 12), // زيادة التباعد بين الأيقونة والنص
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600, // جعل النص أكثر وضوحًا
              fontSize: 16, // تكبير حجم الخط لجعله أكثر وضوحًا
              color: Color(0xFF3B5998), // تخصيص اللون للنص
            ),
          ),
        ],
      ),
    ),
  );
}

// 2. بناء قسم الفئات مع مربعات أصغر بشكل احترافي
// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';

Widget buildCategorySection() {
  return GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 3, // عدد الأعمدة لتقليل حجم المربعات
    crossAxisSpacing: 16, // زيادة التباعد بين الأعمدة
    mainAxisSpacing: 16, // زيادة التباعد بين الصفوف
    children: [
      _buildCategoryItem('أعمال منزلية', Icons.home, Colors.blue),
      _buildCategoryItem('أعمال خارجية', Icons.business, Colors.green),
      _buildCategoryItem('مساعدة', Icons.support_agent, Colors.orange),
      _buildCategoryItem('رعاية', Icons.health_and_safety, Colors.purple),
      _buildCategoryItem('أعمال تقنية', Icons.computer, Colors.teal),
      _buildCategoryItem('تنظيف', Icons.cleaning_services, Colors.red),
    ],
  );
}

// بناء كل عنصر في قسم الفئات مع تأثيرات عند الضغط
Widget _buildCategoryItem(String title, IconData icon, Color color) {
  return GestureDetector(
    onTap: () {
      // إضافة أكواد لتغيير الشاشة أو التنقل إلى صفحة أخرى
    },
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1), // إضافة لون شفاف قليلاً
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 8, // زيادة تأثير الظلال
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color), // تخصيص الأيقونات باللون
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: color, // تخصيص اللون للعنوان
            ),
          ),
        ],
      ),
    ),
  );
}

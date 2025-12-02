// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تتبع المهمة'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Title
            const Text(
              "مهمة: تنظيف المنزل",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3B5998),
              ),
            ),
            const SizedBox(height: 12),

            // Task Status
            const Text(
              "حالة المهمة: جاري التنفيذ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),

            // Task Details (e.g., Time Remaining, Estimated Completion)
            _buildTaskDetails(),

            const SizedBox(height: 20),

            // Progress Indicator Section
            _buildProgressSection(),

            const SizedBox(height: 30),

            // Return to Task Details Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B5998),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "العودة إلى تفاصيل المهمة",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Task Details (e.g., time remaining, estimated completion)
  Widget _buildTaskDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "الوقت المتبقي: 30 دقيقة",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "التاريخ المتوقع: غدًا، 10:00 صباحًا",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 12),
        const Divider(color: Colors.grey),
      ],
    );
  }

  // Progress Section
  Widget _buildProgressSection() {
    // For demonstration, simulate the task completion with a 50% progress bar
    double taskProgress = 0.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "معدل الإنجاز",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3B5998),
          ),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: taskProgress,
          backgroundColor: Colors.grey.shade200,
          color: const Color(0xFF3B5998),
          minHeight: 10,
        ),
        const SizedBox(height: 8),
        Text(
          "${(taskProgress * 100).toStringAsFixed(0)}% أكمل",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3B5998),
          ),
        ),
      ],
    );
  }
}

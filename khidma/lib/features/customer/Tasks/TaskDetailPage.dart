// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:khidma/features/customer/Tasks/TrackingPage.dart';

class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({super.key});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text("تفاصيل المهمة"),
          centerTitle: true,
          elevation: 4,
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and status
              Text(
                "تنظيف المنزل",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B5998),
                ),
              ),

              const SizedBox(height: 8),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "قيد التنفيذ",
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),

              const SizedBox(height: 20),

              // Task Information Card
              _infoCard(
                title: "وصف المهمة",
                content:
                    "تنظيف شامل لجميع غرف المنزل مع ترتيب الأسِرّة ومسح الأرضيات.",
                icon: Icons.description_outlined,
              ),

              const SizedBox(height: 20),

              _infoCard(
                title: "العامل",
                content: "أحمد محمد – متخصص تنظيف",
                icon: Icons.person_outline,
              ),

              const SizedBox(height: 20),

              _infoCard(
                title: "العنوان",
                content: "شارع الجامعة، القاهرة، مصر",
                icon: Icons.location_on_outlined,
              ),

              const SizedBox(height: 20),

              _infoCard(
                title: "موعد التنفيذ",
                content: "السبت، 15 يناير 2025 – الساعة 9:00 صباحاً",
                icon: Icons.access_time_outlined,
              ),

              const SizedBox(height: 30),

              // Action Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Action to track the task
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrackingPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B5998),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "تتبع المهمة",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable card widget for displaying info
  Widget _infoCard({
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF3B5998), size: 30),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF3B5998),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  style: const TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

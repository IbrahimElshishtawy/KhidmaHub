// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khidma/core/app_routes.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 65, 93, 155),
          automaticallyImplyLeading: false,
          title: const Text('الإشعارات'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final title = "إشعار رقم ${index + 1}";
              final message =
                  "هذا هو محتوى الإشعار رقم ${index + 1}. اضغط لعرض التفاصيل.";
              final date = "2025-11-29";

              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.notificationDetail,
                    arguments: {
                      "title": title,
                      "message": message,
                      "date": date,
                    },
                  );
                },
                child: NotificationCard(
                  title: title,
                  message: message,
                  date: date,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Custom widget for displaying individual notifications
class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String date;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(message, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.grey, size: 16),
                const SizedBox(width: 4),
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        isThreeLine: true,
      ),
    );
  }
}

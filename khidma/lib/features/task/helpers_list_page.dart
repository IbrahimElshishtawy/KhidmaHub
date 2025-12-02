// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khidma/features/customer/Tasks/TaskDetailPage.dart';
import 'package:khidma/models/task_request.dart';

/// موديل للمساعد
class HelperModel {
  final String id;
  final String name;
  final double rating;
  final String eta; // المعاد المتوقع للوصول

  HelperModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.eta,
  });
}

class HelpersListPage extends StatelessWidget {
  final TaskRequest taskRequest;

  const HelpersListPage({super.key, required this.taskRequest});

  /// بيانات تجريبية (Dummy) للمساعدين
  List<HelperModel> _dummyHelpers() {
    return [
      HelperModel(id: '1', name: 'أحمد علي', rating: 4.8, eta: 'اليوم 5:00 م'),
      HelperModel(id: '2', name: 'محمد حسن', rating: 4.5, eta: 'اليوم 6:30 م'),
      HelperModel(
        id: '3',
        name: 'سارة محمود',
        rating: 4.9,
        eta: 'غدًا 10:00 ص',
      ),
    ];
  }

  void _onAcceptHelper(BuildContext context, HelperModel helper) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => TaskDetailPage()));
  }

  void _onRejectHelper(BuildContext context, HelperModel helper) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('تم رفض ${helper.name}')));
  }

  void _onViewProfile(BuildContext context, HelperModel helper) {
    // Navigate to helper's profile or task details
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => TaskDetailPage()));
  }

  @override
  Widget build(BuildContext context) {
    final helpers = _dummyHelpers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('المساعدين المتاحين'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        elevation: 2,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: helpers.length,
        itemBuilder: (context, index) {
          final helper = helpers[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,
            shadowColor: Colors.black.withOpacity(0.15),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    helper.name,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '⭐ ${helper.rating.toStringAsFixed(1)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'المعاد: ${helper.eta}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () => _onRejectHelper(context, helper),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: const BorderSide(color: Colors.red),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          'رفض',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      FilledButton(
                        onPressed: () => _onAcceptHelper(context, helper),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          'قبول',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  /// View profile or task details button
                  TextButton(
                    onPressed: () => _onViewProfile(context, helper),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                    child: const Text('عرض الملف الشخصي / تفاصيل المهمة'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

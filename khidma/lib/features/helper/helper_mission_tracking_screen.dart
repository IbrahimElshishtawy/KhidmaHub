import 'package:flutter/material.dart';
import '../../models/order.dart';
import '../../core/app_routes.dart';

class HelperMissionTrackingScreen extends StatelessWidget {
  const HelperMissionTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context)!.settings.arguments as Order?;

    return Scaffold(
      appBar: AppBar(title: const Text('تتبع المهمة')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (order != null)
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  order.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            const SizedBox(height: 12),
            const Text(
              'العميل ينتظر في الموقع المحدد، يمكنك البدء في المهمة عند الوصول.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black12,
                ),
                alignment: Alignment.center,
                child: const Text('خريطة / صورة تتبع'),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('إلغاء المهمة'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.earningsHistory);
                    },
                    child: const Text('إنهاء المهمة'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

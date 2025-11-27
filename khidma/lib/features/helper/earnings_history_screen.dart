import 'package:flutter/material.dart';
import '../../mock/mock_data.dart';

class EarningsHistoryScreen extends StatelessWidget {
  const EarningsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final total = mockHelperEarnings.fold<double>(0, (sum, o) => sum + o.price);

    return Scaffold(
      appBar: AppBar(title: const Text('الأرباح والسجل')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ملخص الأرباح',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${total.toStringAsFixed(2)} ج.م',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0066FF),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'إجمالي الأرباح لآخر ${mockHelperEarnings.length} مهام',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'سجل المهام',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemCount: mockHelperEarnings.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = mockHelperEarnings[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.work_outline),
                      title: Text(item.title),
                      subtitle: Text(
                        '${item.dateTime.day}/${item.dateTime.month}/${item.dateTime.year}',
                      ),
                      trailing: Text(
                        '${item.price.toStringAsFixed(0)} ج.م',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

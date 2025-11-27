import 'package:flutter/material.dart';
import '../../models/order.dart';
import '../../core/app_routes.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context)!.settings.arguments as Order?;

    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل المهمة')),
      body: order == null
          ? const Center(child: Text('لا توجد بيانات مهمة'))
          : Padding(
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
                            'تفاصيل المهمة',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('الخدمة المطلوبة: ${order.title}'),
                          const SizedBox(height: 4),
                          Text('الموقع: ${order.location}'),
                          const SizedBox(height: 4),
                          Text(
                            'التاريخ: ${order.dateTime.day}/${order.dateTime.month}/${order.dateTime.year}',
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'الوقت: ${order.dateTime.hour}:${order.dateTime.minute.toString().padLeft(2, '0')}',
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'الأجر المتفق عليه: ${order.price.toStringAsFixed(0)} ج.م',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0066FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'تفاصيل العميل',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const CircleAvatar(child: Icon(Icons.person)),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('عليك السلام'),
                                  Text(
                                    'عميل موثوق (4.9)',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.phone),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.chat_bubble_outline),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black12,
                      ),
                      alignment: Alignment.center,
                      child: const Text('خريطة / صورة للموقع'),
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
                          child: const Text('رفض'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.helperMissionTracking,
                              arguments: order,
                            );
                          },
                          child: const Text('قبول'),
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

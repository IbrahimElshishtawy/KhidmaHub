import 'package:flutter/material.dart';
import '../../models/service.dart';
import '../../core/app_routes.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = ModalRoute.of(context)!.settings.arguments as Service?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الخدمة'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: service == null
          ? const Center(child: Text('لا توجد بيانات خدمة'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'مدة الخدمة: ${service.duration}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        service.price.toStringAsFixed(0),
                        style: const TextStyle(
                          color: Color(0xFF0066FF),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text('جنيه'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'ما هي الخدمات التي تريدها من الموظف؟',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'اكتب تفاصيل طلبك هنا...',
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'ماذا تشمل الخدمة؟',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  const Text('• أمانة الموظف'),
                  const Text('• الالتزام بالوقت'),
                  const Text('• متابعة من خدمة في حال وجود مشكلة'),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.searchingHelper);
                      },
                      child: const Text('تأكيد الطلب'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

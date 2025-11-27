import 'package:flutter/material.dart';
import '../../mock/mock_data.dart';
import '../../core/app_routes.dart';

class MatchedHelperScreen extends StatelessWidget {
  const MatchedHelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final helper = helperUser;

    return Scaffold(
      appBar: AppBar(title: const Text('تم العثور على المساعد')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: helper.avatarUrl.isNotEmpty
                          ? NetworkImage(helper.avatarUrl)
                          : null,
                      child: helper.avatarUrl.isEmpty
                          ? const Icon(Icons.person, size: 32)
                          : null,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      helper.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, size: 18, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(helper.rating.toStringAsFixed(1)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'دقائق للوصول المتوقع: 10',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.phone),
                            label: const Text('اتصل بالمساعد'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.chat_bubble_outline),
                            label: const Text('أرسل رسالة'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.missionInProgress);
                },
                child: const Text('بدء المهمة'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

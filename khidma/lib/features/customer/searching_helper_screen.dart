import 'package:flutter/material.dart';

class SearchingHelperScreen extends StatelessWidget {
  const SearchingHelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('البحث عن مساعد')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Icon(Icons.search, size: 120),
            const SizedBox(height: 24),
            const Text(
              'نبحث عن أفضل مساعد لك',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'قد يستغرق الأمر بضع لحظات، برجاء الانتظار.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            const LinearProgressIndicator(minHeight: 5),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('إلغاء البحث'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/app_routes.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('خدمة')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'خدمة في خدمتك',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0066FF),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/role_selection.png', // صورة الشخص اللي ماسك موبايل
                  height: 220,
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.customerLogin);
                },
                child: const Text('تسجيل الدخول كعميل'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.helperLogin);
                },
                child: const Text('تسجيل الدخول كمساعد'),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

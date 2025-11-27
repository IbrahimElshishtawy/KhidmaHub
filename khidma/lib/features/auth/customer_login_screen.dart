import 'package:flutter/material.dart';
import '../../core/app_routes.dart';

class CustomerLoginScreen extends StatelessWidget {
  const CustomerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول / التسجيل')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'خدمة',
                style: TextStyle(
                  color: Color(0xFF0066FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'البريد الإلكتروني',
                      hintText: 'ادخل بريدك الإلكتروني',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'كلمة المرور',
                      hintText: 'ادخل كلمة المرور',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Fake login → يروح على Home
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.customerHome,
                        );
                      },
                      child: const Text('تسجيل الدخول'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: const Text('هل نسيت كلمة المرور؟'),
                  ),
                  TextButton(
                    onPressed: () {
                      // هنا ممكن تفتح Screen تسجيل جديد لاحقًا
                    },
                    child: const Text('سجل الآن لست لديك حساب؟'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('أو'),
            const SizedBox(height: 16),
            _buildSocialButton('المتابعة باستخدام Google'),
            const SizedBox(height: 8),
            _buildSocialButton('المتابعة باستخدام Apple'),
            const SizedBox(height: 8),
            _buildSocialButton('المتابعة باستخدام Facebook'),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(onPressed: () {}, child: Text(text)),
    );
  }
}

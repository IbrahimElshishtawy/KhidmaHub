import 'package:flutter/material.dart';
import 'package:khidma/core/app_routes.dart';

late TextEditingController emailController;
late TextEditingController passwordController;

Widget buildLoginCard(BuildContext context) {
  emailController = TextEditingController();
  passwordController = TextEditingController();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.support_agent_outlined,
            color: Color(0xFF0F64FF),
            size: 26,
          ),
          Text(
            "تسجيل الدخول",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
        ],
      ),
      const SizedBox(height: 16),

      // Email
      TextField(
        controller: emailController,
        textDirection: TextDirection.rtl,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.email_outlined),
          labelText: "البريد الإلكتروني",
          hintText: "ادخل بريدك الإلكتروني",
        ),
      ),

      const SizedBox(height: 12),

      // Password
      TextField(
        controller: passwordController,
        obscureText: true,
        textDirection: TextDirection.rtl,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.lock_outline),
          labelText: "كلمة المرور",
          hintText: "ادخل كلمة المرور",
        ),
      ),

      const SizedBox(height: 8),

      Align(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () {},
          child: const Text(
            "هل نسيت كلمة المرور؟",
            style: TextStyle(fontSize: 13),
          ),
        ),
      ),

      const SizedBox(height: 12),

      SizedBox(
        height: 46,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.helperHome);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text("تسجيل الدخول", style: TextStyle(fontSize: 16)),
        ),
      ),
    ],
  );
}

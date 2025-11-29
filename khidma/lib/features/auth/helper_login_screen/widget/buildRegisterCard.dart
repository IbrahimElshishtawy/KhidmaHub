// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:khidma/core/app_routes.dart';
import 'package:khidma/features/auth/helper_login_screen/widget/buildIdUploadBox.dart';

Widget buildRegisterCard(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Text(
        "إنشاء حساب جديد",
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
      ),
      const SizedBox(height: 16),
      // Card for registration fields
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  labelText: "الاسم الكامل",
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone_outlined),
                  labelText: "رقم الهاتف",
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: cityController,
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_on_outlined),
                  labelText: "المدينة",
                ),
              ),
              const SizedBox(height: 18),
              buildIdUploadBox(),
            ],
          ),
        ),
      ),
      const SizedBox(height: 24),
      SizedBox(
        height: 46,
        child: OutlinedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                closeIconColor: Colors.green,
                content: Text(
                  'تم إنشاء الحساب بنجاح!',
                  style: TextStyle(fontSize: 16),
                ),
                duration: Duration(seconds: 2),
              ),
            );
            Navigator.pushReplacementNamed(context, AppRoutes.helperHome);
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF0F64FF), width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            "إنشاء حساب",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF0F64FF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ],
  );
}

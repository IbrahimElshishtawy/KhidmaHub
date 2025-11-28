import 'package:flutter/material.dart';

/// أزرار تسجيل الدخول بالسوشيال
class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSocialButton(
          context,
          text: 'المتابعة باستخدام Google',
          icon: Icons.g_mobiledata,
        ),
        const SizedBox(height: 8),
        _buildSocialButton(
          context,
          text: 'المتابعة باستخدام Apple',
          icon: Icons.apple,
        ),
        const SizedBox(height: 8),
        _buildSocialButton(
          context,
          text: 'المتابعة باستخدام Facebook',
          icon: Icons.facebook,
        ),
      ],
    );
  }

  Widget _buildSocialButton(
    BuildContext context, {
    required String text,
    required IconData icon,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 20, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white.withOpacity(0.85)),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          backgroundColor: Colors.white.withOpacity(0.12),
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'خدمة',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white.withOpacity(0.95),
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'سجّل دخولك لمتابعة طلباتك بسهولة',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 13),
        ),
      ],
    );
  }
}

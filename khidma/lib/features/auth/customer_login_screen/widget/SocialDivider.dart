// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';

class SocialDivider extends StatelessWidget {
  const SocialDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.white.withOpacity(0.7))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'أو تابع باستخدام',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.white.withOpacity(0.7))),
      ],
    );
  }
}

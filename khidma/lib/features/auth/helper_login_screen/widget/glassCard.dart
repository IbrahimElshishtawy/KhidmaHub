// ignore_for_file: deprecated_member_use

// Reusable Glass Card
import 'dart:ui';

import 'package:flutter/material.dart';

Widget glassCard({required Widget child}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(22),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.82),
          border: Border.all(color: Colors.white.withOpacity(0.85)),
          borderRadius: BorderRadius.circular(22),
        ),
        child: child,
      ),
    ),
  );
}

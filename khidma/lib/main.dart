import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'core/app_routes.dart';

void main() {
  runApp(const KhidmaApp());
}

class KhidmaApp extends StatelessWidget {
  const KhidmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khidma',
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(),
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      // أول شاشة: الـ Onboarding
      initialRoute: AppRoutes.onboarding,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

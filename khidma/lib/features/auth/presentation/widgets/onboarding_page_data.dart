import 'package:flutter/material.dart';

/// A single page model for the onboarding flow.
class OnboardingPageData {
  final String title;
  final String description;
  final IconData icon;
  final List<Color> gradientColors;
  final List<IconData> floatingIcons;

  const OnboardingPageData({
    required this.title,
    required this.description,
    required this.icon,
    required this.gradientColors,
    required this.floatingIcons,
  });
}

/// The 3 onboarding pages data.
const List<OnboardingPageData> onboardingPages = [
  OnboardingPageData(
    title: 'خدمة.. بوابتك لراحة البال',
    description:
        'اطلب خدمتك بكل سهولة وسرعة من موبايلك في أي وقت، واحصل على أفضل المساعدين المحترفين.',
    icon: Icons.rocket_launch_rounded,
    gradientColors: [Color(0xFF0D47A1), Color(0xFF1565C0), Color(0xFF42A5F5)],
    floatingIcons: [
      Icons.cleaning_services_rounded,
      Icons.build_rounded,
      Icons.electrical_services_rounded,
      Icons.plumbing_rounded,
    ],
  ),
  OnboardingPageData(
    title: 'احجز خدمتك بخطوات بسيطة',
    description:
        'اختر الخدمة، حدد الموعد، واترك الباقي علينا. نظام ذكي يوصلك بأقرب مساعد متاح.',
    icon: Icons.touch_app_rounded,
    gradientColors: [Color(0xFF4A148C), Color(0xFF7B1FA2), Color(0xFFBA68C8)],
    floatingIcons: [
      Icons.calendar_today_rounded,
      Icons.location_on_rounded,
      Icons.timer_rounded,
      Icons.star_rounded,
    ],
  ),
  OnboardingPageData(
    title: 'جودة مضمونة وتقييم شفاف',
    description:
        'كل مساعد يمر بفحص دقيق. شارك تقييمك بعد كل خدمة لضمان أعلى جودة.',
    icon: Icons.verified_rounded,
    gradientColors: [Color(0xFF004D40), Color(0xFF00796B), Color(0xFF4DB6AC)],
    floatingIcons: [
      Icons.shield_rounded,
      Icons.thumb_up_alt_rounded,
      Icons.workspace_premium_rounded,
      Icons.verified_user_rounded,
    ],
  ),
];

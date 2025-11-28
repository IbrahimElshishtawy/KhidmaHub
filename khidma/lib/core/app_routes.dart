import 'package:flutter/material.dart';

import '../features/auth/onboarding_screen.dart';
import '../features/auth/role_selection_screen.dart';
import '../features/auth/customer_login_screen.dart';
import '../features/auth/helper_login_screen.dart';
import '../features/customer/customer_home_screen.dart';
import '../features/customer/service_details_screen.dart';
import '../features/customer/searching_helper_screen.dart';
import '../features/customer/matched_helper_screen.dart';
import '../features/customer/mission_in_progress_screen.dart';
import '../features/customer/rating_payment_screen.dart';
import '../features/customer/payment_screen.dart';
import '../features/customer/customer_profile_screen.dart';
import '../features/customer/settings_screen.dart';
import '../features/helper/helper_home_screen.dart';
import '../features/helper/job_details_screen.dart';
import '../features/helper/helper_mission_tracking_screen.dart';
import '../features/helper/earnings_history_screen.dart';

class AppRoutes {
  static const onboarding = '/';
  static const roleSelection = '/role-selection';
  static const customerLogin = '/customer-login';
  static const helperLogin = '/helper-login';
  static const customerHome = '/customer-home';
  static const serviceDetails = '/service-details';
  static const searchingHelper = '/searching-helper';
  static const matchedHelper = '/matched-helper';
  static const missionInProgress = '/mission-in-progress';
  static const ratingPayment = '/rating-payment';
  static const payment = '/payment';
  static const customerProfile = '/customer-profile';
  static const settings = '/settings';
  static const helperHome = '/helper-home';
  static const jobDetails = '/job-details';
  static const helperMissionTracking = '/helper-mission-tracking';
  static const earningsHistory = '/earnings-history';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case roleSelection:
        return MaterialPageRoute(builder: (_) => const RoleSelectionScreen());
      case customerLogin:
        return MaterialPageRoute(builder: (_) => const CustomerLoginScreen());
      case helperLogin:
        return MaterialPageRoute(builder: (_) => const HelperLoginScreen());
      case customerHome:
        return MaterialPageRoute(builder: (_) => const CustomerHomeScreen());
      case serviceDetails:
        return MaterialPageRoute(builder: (_) => const ServiceDetailsScreen());
      case searchingHelper:
        return MaterialPageRoute(builder: (_) => const SearchingHelperScreen());
      case matchedHelper:
        return MaterialPageRoute(builder: (_) => const MatchedHelperScreen());
      case missionInProgress:
        return MaterialPageRoute(
          builder: (_) => const MissionInProgressScreen(),
        );
      case ratingPayment:
        return MaterialPageRoute(builder: (_) => const RatingPaymentScreen());
      case payment:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case customerProfile:
        return MaterialPageRoute(builder: (_) => const CustomerProfileScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case helperHome:
        return MaterialPageRoute(builder: (_) => const HelperHomeScreen());
      case jobDetails:
        return MaterialPageRoute(builder: (_) => const JobDetailsScreen());
      case helperMissionTracking:
        return MaterialPageRoute(
          builder: (_) => const HelperMissionTrackingScreen(),
        );
      case earningsHistory:
        return MaterialPageRoute(builder: (_) => const EarningsHistoryScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}

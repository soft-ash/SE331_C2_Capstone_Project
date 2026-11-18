import 'package:get/get.dart';

import '../auth/screens/all_set_screen.dart';
import '../auth/screens/forgot_password_screen.dart';
import '../auth/screens/login_screen.dart';
import '../auth/screens/register_screen.dart';
import '../auth/screens/reset_password_screen.dart';
import '../auth/screens/verify_email_screen.dart';
import '../bottom_nav/screens/main_nav_screen.dart';
import '../onboarding/screens/onboarding_screen.dart';
import '../profile/screens/profile_screen.dart';
import '../property_detail/screens/property_detail_screen.dart';
import '../search/screens/search_screen.dart';
import '../sell/screens/sell_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String initial = AppRoutes.onboarding;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.verifyEmail,
      page: () => const VerifyEmailScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.allSet,
      page: () => const AllSetScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const MainNavScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.propertyDetail,
      page: () => const PropertyDetailScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.sell,
      page: () => const SellScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}

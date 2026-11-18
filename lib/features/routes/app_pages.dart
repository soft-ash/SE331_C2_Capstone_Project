import 'package:get/get.dart';

import '../auth/screens/all_set_screen.dart';
import '../auth/screens/forgot_password_screen.dart';
import '../auth/screens/login_screen.dart';
import '../auth/screens/register_screen.dart';
import '../auth/screens/reset_password_screen.dart';
import '../auth/screens/verify_email_screen.dart';
import '../onboarding/screens/onboarding_screen.dart';
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
  ];
}

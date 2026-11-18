import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:ghorbari/features/auth/controllers/login_controller.dart';
import 'package:ghorbari/features/auth/screens/all_set_screen.dart';
import 'package:ghorbari/features/auth/screens/forgot_password_screen.dart';
import 'package:ghorbari/features/auth/screens/login_screen.dart';
import 'package:ghorbari/features/auth/screens/register_screen.dart';
import 'package:ghorbari/features/auth/screens/reset_password_screen.dart';
import 'package:ghorbari/features/auth/screens/verify_email_screen.dart';
import 'package:ghorbari/ghorbari.dart';

void main() {
  setUp(() {
    Get.reset();
  });

  testWidgets('LoginScreen smoke test: renders fields, social login, and links',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Ghorbari());
    await tester.pumpAndSettle();

    Get.to(() => const LoginScreen());
    await tester.pumpAndSettle();

    expect(find.text('Welcome Back!'), findsOneWidget);
    expect(find.text('Sign in to continue your journey'), findsOneWidget);
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Remember me'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('or continue with'), findsOneWidget);
    expect(find.textContaining('Register'), findsOneWidget);

    final LoginController controller = Get.find<LoginController>();
    expect(controller.rememberMe.value, false);

    // Toggle remember me
    await tester.tap(find.text('Remember me'));
    await tester.pump();
    expect(controller.rememberMe.value, true);
  });

  testWidgets('RegisterScreen smoke test: renders all form fields and terms',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Ghorbari());
    await tester.pumpAndSettle();

    Get.to(() => const RegisterScreen());
    await tester.pumpAndSettle();

    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
    expect(find.textContaining('Terms & Conditions'), findsOneWidget);
  });

  testWidgets('ForgotPasswordScreen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Ghorbari());
    await tester.pumpAndSettle();

    Get.to(() => const ForgotPasswordScreen());
    await tester.pumpAndSettle();

    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Send Reset Link'), findsOneWidget);
    expect(find.text('Back to Sign In'), findsOneWidget);
  });

  testWidgets('VerifyEmailScreen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Ghorbari());
    await tester.pumpAndSettle();

    Get.to(() => const VerifyEmailScreen());
    await tester.pumpAndSettle();

    expect(find.text('Verify Your Email'), findsOneWidget);
    expect(find.textContaining("We've sent a verification link to"),
        findsOneWidget);
    expect(find.text('Resend Email'), findsOneWidget);
  });

  testWidgets('ResetPasswordScreen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Ghorbari());
    await tester.pumpAndSettle();

    Get.to(() => const ResetPasswordScreen());
    await tester.pumpAndSettle();

    expect(find.text('Reset Password'), findsWidgets);
    expect(find.text('New Password'), findsOneWidget);
    expect(find.text('Confirm New Password'), findsOneWidget);
    expect(find.text('At least 8 characters'), findsOneWidget);
    expect(find.text('Include a number'), findsOneWidget);
    expect(find.text('Include a letter'), findsOneWidget);
  });

  testWidgets('AllSetScreen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Ghorbari());
    await tester.pumpAndSettle();

    Get.to(() => const AllSetScreen());
    await tester.pumpAndSettle();

    expect(find.text('All Set!'), findsOneWidget);
    expect(find.text('Your account has been verified successfully.'),
        findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });
}

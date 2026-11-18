import 'dart:async';
import 'package:get/get.dart';

import '../../../core/logger/app_logger.dart';
import '../../routes/app_routes.dart';

class VerifyEmailController extends GetxController {
  late final String email;
  final RxInt secondsRemaining = 60.obs;
  final RxBool canResend = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map && args.containsKey('email')) {
      email = args['email'] as String;
    } else {
      email = 'rafat@example.com';
    }
    startCountdown();
    AppLogger.info('VerifyEmailController initialized for $email');
  }

  void startCountdown() {
    canResend.value = false;
    secondsRemaining.value = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }

  void resendEmail() {
    if (canResend.value) {
      AppLogger.info('Resending verification email to $email');
      startCountdown();
    }
  }

  void onVerified() {
    AppLogger.success('Email verified successfully');
    Get.offNamed(AppRoutes.allSet);
  }

  @override
  void onClose() {
    _timer?.cancel();
    AppLogger.info('VerifyEmailController disposed');
    super.onClose();
  }
}

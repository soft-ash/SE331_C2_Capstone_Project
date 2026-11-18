import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/logger/app_logger.dart';
import '../../routes/app_routes.dart';

class ProfileController extends GetxController {
  final RxString userName = 'Rafat'.obs;
  final RxString userEmail = 'rafat@example.com'.obs;
  final RxBool isBengali = false.obs;

  @override
  void onInit() {
    super.onInit();
    isBengali.value = Get.locale?.languageCode == 'bn';
    AppLogger.info('ProfileController initialized');
  }

  void toggleLanguage() {
    if (isBengali.value) {
      Get.updateLocale(const Locale('en', 'US'));
      isBengali.value = false;
      AppLogger.info('Locale switched to en_US');
    } else {
      Get.updateLocale(const Locale('bn', 'BD'));
      isBengali.value = true;
      AppLogger.info('Locale switched to bn_BD');
    }
  }

  void logout() {
    AppLogger.info('User logged out');
    Get.offAllNamed(AppRoutes.login);
  }
}

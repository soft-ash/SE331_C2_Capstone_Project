import 'package:get/get.dart';

import '../../../core/logger/app_logger.dart';
import '../../routes/app_routes.dart';

class AllSetController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    AppLogger.info('AllSetController initialized');
  }

  void onContinue() {
    AppLogger.success('User finished authentication flow, proceeding to home');
    Get.offAllNamed(AppRoutes.home);
  }
}

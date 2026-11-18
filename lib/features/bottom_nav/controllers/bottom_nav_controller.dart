import 'package:get/get.dart';
import '../../../core/logger/app_logger.dart';

class BottomNavController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
    AppLogger.info('Bottom nav changed to index: $index');
  }

  void goToHome() => changeIndex(0);
  void goToSell() => changeIndex(1);
  void goToSearch() => changeIndex(2);
  void goToProfile() => changeIndex(3);
}

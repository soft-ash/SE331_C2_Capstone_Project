import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/app_strings.dart';
import '../../../core/logger/app_logger.dart';
import '../../routes/app_routes.dart';
import '../models/onboarding_item_model.dart';

class OnboardingController extends GetxController {
  late final PageController pageController;
  final RxInt currentPage = 0.obs;

  final List<OnboardingItemModel> items = const [
    OnboardingItemModel(
      index: 0,
      titlePart1Key: AppStrings.onboarding1Title1,
      titlePart2Key: AppStrings.onboarding1Title2,
      titleHighlightKey: AppStrings.onboarding1TitleHighlight,
      hasUnderlineAccent: true,
      descriptionKey: AppStrings.onboarding1Desc,
      imagePath: 'assets/images/onboarding1.webp',
      isImageAtBottom: true,
      showLogo: true,
    ),
    OnboardingItemModel(
      index: 1,
      titlePart1Key: AppStrings.onboarding2Title1,
      titleHighlightKey: AppStrings.onboarding2TitleHighlight,
      descriptionKey: AppStrings.onboarding2Desc,
      imagePath: 'assets/images/onboarding2.png',
      isImageAtBottom: false,
      showLogo: false,
    ),
    OnboardingItemModel(
      index: 2,
      titlePart1Key: AppStrings.onboarding3Title1,
      titlePart2Key: AppStrings.onboarding3Title2,
      titleHighlightKey: AppStrings.onboarding3TitleHighlight,
      descriptionKey: AppStrings.onboarding3Desc,
      imagePath: 'assets/images/onboarding3.png',
      isImageAtBottom: false,
      showLogo: false,
    ),
  ];

  int get totalPages => items.length;
  bool get isFirstPage => currentPage.value == 0;
  bool get isLastPage => currentPage.value == totalPages - 1;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    AppLogger.info('OnboardingController initialized');
  }

  void onPageChanged(int index) {
    currentPage.value = index;
    AppLogger.info('Onboarding page changed to: $index');
  }

  void nextPage() {
    if (!isLastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      getStarted();
    }
  }

  void previousPage() {
    if (!isFirstPage) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip() {
    AppLogger.info('Skipping onboarding');
    pageController.animateToPage(
      totalPages - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void getStarted() {
    AppLogger.success('Onboarding completed, navigating to login');
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    AppLogger.info('OnboardingController disposed');
    super.onClose();
  }
}

import 'package:get/get.dart';

import '../../../core/constants/images.dart';
import '../../../core/logger/app_logger.dart';
import '../../routes/app_routes.dart';
import '../models/property_model.dart';

class HomeController extends GetxController {
  final RxInt currentBannerIndex = 0.obs;
  final RxString selectedCategory = 'Buy'.obs;
  final RxInt unreadNotifications = 1.obs;

  final RxList<PropertyModel> featuredProperties = <PropertyModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadSampleProperties();
    AppLogger.info('HomeController initialized');
  }

  void _loadSampleProperties() {
    featuredProperties.assignAll([
      PropertyModel(
        id: 'prop-1',
        title: 'Modern Duplex House',
        type: 'House',
        purpose: 'For Sale',
        price: 8500000,
        formattedPrice: '৳ 85,00,000',
        location: 'Dhanmondi, Dhaka',
        beds: 3,
        baths: 2,
        sqft: 1350,
        description:
            'A beautiful duplex house in Dhanmondi with modern design, spacious rooms and a peaceful environment. Close to top schools and shopping centers.',
        image: AppImages.onboarding1,
        images: [
          AppImages.onboarding1,
          AppImages.onboarding2,
          AppImages.onboarding3,
        ],
        features: const [
          'Parking',
          'Lift',
          'Garden',
          'Gated Community',
          'Air Condition',
          'Security',
        ],
        isFavorite: false,
      ),
      PropertyModel(
        id: 'prop-2',
        title: 'Luxury Gulshan Villa',
        type: 'Duplex',
        purpose: 'For Sale',
        price: 12500000,
        formattedPrice: '৳ 1,25,00,000',
        location: 'Gulshan, Dhaka',
        beds: 4,
        baths: 3,
        sqft: 2400,
        description:
            'A beautiful duplex house in Gulshan with modern design, spacious rooms and a peaceful environment.',
        image: AppImages.onboarding1,
        images: [
          AppImages.onboarding1,
          AppImages.onboarding2,
          AppImages.onboarding3,
        ],
        features: const [
          'Parking',
          'Gated Community',
          'Air Condition',
          'Security',
        ],
        isFavorite: true,
      ),
      PropertyModel(
        id: 'prop-3',
        title: 'Premium Banani Apartment',
        type: 'Apartment',
        purpose: 'For Rent',
        price: 75000,
        formattedPrice: '৳ 75,000/mo',
        location: 'Banani, Dhaka',
        beds: 3,
        baths: 3,
        sqft: 1850,
        description:
            'Exquisite high-rise apartment in Banani offering panoramic city views and 24/7 power backup.',
        image: AppImages.onboarding1,
        images: [
          AppImages.onboarding1,
          AppImages.onboarding2,
        ],
        features: const ['Lift', 'Parking', 'Security', 'Air Condition'],
        isFavorite: false,
      ),
    ]);
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
    AppLogger.info('Selected category: $category');
  }

  void onBannerChanged(int index) {
    currentBannerIndex.value = index;
  }

  void toggleFavorite(String id) {
    final index = featuredProperties.indexWhere((p) => p.id == id);
    if (index != -1) {
      final current = featuredProperties[index];
      featuredProperties[index] = current.copyWith(
        isFavorite: !current.isFavorite,
      );
      AppLogger.info('Toggled favorite for $id to ${!current.isFavorite}');
    }
  }

  void openPropertyDetail(PropertyModel property) {
    AppLogger.info('Opening property detail: ${property.title}');
    Get.toNamed(AppRoutes.propertyDetail, arguments: property);
  }

  void onSearchTap() {
    AppLogger.info('Navigating to search properties');
    Get.toNamed(AppRoutes.search);
  }

  void onNotificationTap() {
    AppLogger.info('Notification clicked');
  }
}

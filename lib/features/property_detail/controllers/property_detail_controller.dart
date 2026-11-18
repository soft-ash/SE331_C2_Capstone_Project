import 'package:get/get.dart';

import '../../../core/constants/images.dart';
import '../../../core/logger/app_logger.dart';
import '../../home/models/property_model.dart';

class PropertyDetailController extends GetxController {
  late final PropertyModel property;
  final RxBool isFavorite = false.obs;
  final RxBool isDescriptionExpanded = false.obs;
  final RxInt currentImageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is PropertyModel) {
      property = args;
    } else {
      // Default fallback property for testing/direct access
      property = PropertyModel(
        id: 'prop-fallback',
        title: 'Modern Duplex House',
        type: 'House',
        purpose: 'For Sale',
        price: 12500000,
        formattedPrice: '৳ 1,25,00,000',
        location: 'Gulshan, Dhaka',
        beds: 4,
        baths: 3,
        sqft: 2400,
        description:
            'A beautiful duplex house in Gulshan with modern design, spacious rooms and a peaceful environment. Features luxury fittings, dedicated private parking and garden.',
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
      );
    }
    isFavorite.value = property.isFavorite;
    AppLogger.info('PropertyDetailController initialized for: ${property.title}');
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
    AppLogger.info('Toggled favorite to: ${isFavorite.value}');
  }

  void toggleDescription() {
    isDescriptionExpanded.value = !isDescriptionExpanded.value;
  }

  void callAgent() {
    AppLogger.info('Calling agent for ${property.title}');
  }

  void messageAgent() {
    AppLogger.info('Messaging agent for ${property.title}');
  }

  void shareProperty() {
    AppLogger.info('Sharing property ${property.title}');
  }
}

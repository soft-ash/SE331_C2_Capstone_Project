import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:ghorbari/features/bottom_nav/screens/main_nav_screen.dart';
import 'package:ghorbari/features/home/models/property_model.dart';
import 'package:ghorbari/features/property_detail/screens/property_detail_screen.dart';
import 'package:ghorbari/features/search/screens/search_screen.dart';
import 'package:ghorbari/ghorbari.dart';

void main() {
  setUp(() {
    Get.reset();
  });

  testWidgets('MainNavScreen smoke test: renders bottom nav tabs and home content',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Ghorbari());
    await tester.pumpAndSettle();

    Get.to(() => const MainNavScreen());
    await tester.pumpAndSettle();

    // Verify home screen elements
    expect(find.text('Hello, Rafat 👋'), findsOneWidget);
    expect(find.text('Find your dream property today'), findsOneWidget);
    expect(find.text('Search houses, apartments...'), findsOneWidget);
    expect(find.text('Featured Properties'), findsOneWidget);
    expect(find.text('Buy'), findsWidgets);
    expect(find.text('Sell'), findsWidgets);

    // Verify bottom nav items
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('SearchScreen smoke test: renders location field, price range, and filters',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Ghorbari());
    await tester.pumpAndSettle();

    Get.to(() => const SearchScreen());
    await tester.pumpAndSettle();

    expect(find.text('Search Properties'), findsOneWidget);
    expect(find.text('Search by location...'), findsOneWidget);
    expect(find.text('Price Range'), findsOneWidget);
    expect(find.text('Property Type'), findsOneWidget);
    expect(find.text('Features'), findsOneWidget);
    expect(find.text('Parking'), findsOneWidget);
    expect(find.text('Apply Filters'), findsOneWidget);
  });

  testWidgets('PropertyDetailScreen smoke test: renders specs, price, and actions',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Ghorbari());
    await tester.pumpAndSettle();

    final testProperty = PropertyModel(
      id: 'test-1',
      title: 'Modern Duplex House',
      type: 'House',
      purpose: 'For Sale',
      price: 12500000,
      formattedPrice: '৳ 1,25,00,000',
      location: 'Gulshan, Dhaka',
      beds: 4,
      baths: 3,
      sqft: 2400,
      description: 'A beautiful duplex house in Gulshan with modern design.',
      image: 'assets/images/onboarding1.webp',
    );

    Get.to(() => const PropertyDetailScreen(), arguments: testProperty);
    await tester.pumpAndSettle();

    expect(find.text('৳ 1,25,00,000'), findsOneWidget);
    expect(find.text('Modern Duplex House'), findsOneWidget);
    expect(find.text('Gulshan, Dhaka'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('2400'), findsOneWidget);
    expect(find.text('Call'), findsOneWidget);
    expect(find.text('Message'), findsOneWidget);
  });
}

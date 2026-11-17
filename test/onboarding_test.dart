import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:ghorbari/features/onboarding/controllers/onboarding_controller.dart';
import 'package:ghorbari/features/onboarding/widgets/onboarding_logo.dart';
import 'package:ghorbari/ghorbari.dart';

void main() {
  setUp(() {
    Get.reset();
  });

  testWidgets(
      'Onboarding flow smoke test: slide 1 -> slide 2 -> back -> slide 3',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Ghorbari());
    await tester.pumpAndSettle();

    // Verify slide 1 is displayed
    expect(find.byType(OnboardingLogo), findsOneWidget);
    expect(find.textContaining('Buy, Sell or Rent'), findsOneWidget);
    expect(find.textContaining('Property'), findsOneWidget);
    expect(find.textContaining('with Ease'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    final OnboardingController controller = Get.find<OnboardingController>();
    expect(controller.currentPage.value, 0);

    // Tap Next button to go to slide 2
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(controller.currentPage.value, 1);
    expect(find.textContaining('Explore Properties'), findsOneWidget);
    expect(find.textContaining('Your Way'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    // Tap Back button to return to slide 1
    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();

    expect(controller.currentPage.value, 0);
    expect(find.textContaining('Buy, Sell or Rent'), findsOneWidget);

    // Advance to slide 2 again
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Advance to slide 3
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(controller.currentPage.value, 2);
    expect(find.textContaining('Your Dream Home'), findsOneWidget);
    expect(find.textContaining('Tap Away'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}

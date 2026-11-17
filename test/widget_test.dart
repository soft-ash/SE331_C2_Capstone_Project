import 'package:flutter_test/flutter_test.dart';
import 'package:ghorbari/ghorbari.dart';

void main() {
  testWidgets('App renders onboarding screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Ghorbari());
    expect(find.byType(Ghorbari), findsOneWidget);
  });
}

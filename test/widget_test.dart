import 'package:flutter_test/flutter_test.dart';

import 'package:congest/app/app.dart';
import 'package:congest/shared/widgets/congest_logo.dart';

void main() {
  testWidgets('Splash screen shows ConGest logo', (WidgetTester tester) async {
    await tester.pumpWidget(const CongestApp());

    // Verify that ConGest logo is displayed
    expect(find.byType(CongestLogo), findsOneWidget);
    expect(find.text('ConGest'), findsOneWidget);
  });
}

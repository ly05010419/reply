import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reply/views/MyApp.dart';

void main() {
  testWidgets('Smart Home test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Licht Wohnzimmer'), findsOneWidget);
    expect(find.text('Licht Schlafzimmer'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();
  });
}

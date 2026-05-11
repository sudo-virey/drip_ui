import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:drip_ui/drip_ui.dart';

void main() {
  testWidgets('DripProductSquareCard shows image on top and details below', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 220,
              child: DripProductSquareCard(
                productName: 'Miel orgánica',
                price: 'Q48.00',
                unit: 'frasco',
                label: 'Nuevo',
                store: 'Apicultura del Norte',
                onAdd: () {},
                image: Container(color: Colors.amber),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Nuevo'), findsOneWidget);
    expect(find.text('Miel orgánica'), findsOneWidget);
    expect(find.text('Apicultura del Norte'), findsOneWidget);
    expect(find.text('Q48.00'), findsOneWidget);
    expect(find.text('/ frasco'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
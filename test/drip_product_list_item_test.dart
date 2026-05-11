import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:drip_ui/drip_ui.dart';

void main() {
  testWidgets('DripProductListItem shows optional label and store', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DripProductListItem(
            productName: 'Queso fresco',
            price: 'Q35.00',
            unit: 'kg',
            label: 'Nuevo',
            store: 'Tienda Central',
            onAdd: () {},
          ),
        ),
      ),
    );

    expect(find.text('Nuevo'), findsOneWidget);
    expect(find.text('Tienda Central'), findsOneWidget);
    expect(find.text('Queso fresco'), findsOneWidget);
    expect(find.text('Q35.00'), findsOneWidget);
    expect(find.text('/ kg'), findsOneWidget);
  });

  testWidgets('DripProductListItem can hide label and store', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DripProductListItem(
            productName: 'Queso fresco',
            price: 'Q35.00',
            unit: 'kg',
            label: 'Nuevo',
            store: 'Tienda Central',
            showLabel: false,
            showStore: false,
            onAdd: () {},
          ),
        ),
      ),
    );

    expect(find.text('Nuevo'), findsNothing);
    expect(find.text('Tienda Central'), findsNothing);
    expect(find.text('Queso fresco'), findsOneWidget);
  });
}
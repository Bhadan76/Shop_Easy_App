import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_easy/app/app.dart';

void main() {
  testWidgets('home screen displays shopping sections', (tester) async {
    tester.view.physicalSize = const Size(720, 1600);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ShopEasyApp());
    await tester.pumpAndSettle();

    expect(find.text('Shop Easy'), findsOneWidget);
    expect(find.text('Search for products...'), findsOneWidget);
    expect(find.text('Big Summer Sale'), findsOneWidget);
    expect(find.text('Categories'), findsOneWidget);
    expect(find.text('Popular Products'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.drag(find.byType(ListView).first, const Offset(0, -700));
    await tester.pumpAndSettle();

    expect(find.text('Wireless Headphones'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('home screen fits a compact phone width', (tester) async {
    tester.view.physicalSize = const Size(640, 1280);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ShopEasyApp());
    await tester.pumpAndSettle();

    expect(find.text('Shop Easy'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.drag(find.byType(ListView).first, const Offset(0, -700));
    await tester.pumpAndSettle();

    expect(find.text('Men\'s Hoodie'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

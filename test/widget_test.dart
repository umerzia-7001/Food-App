// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/core/auth/presentation/login_screen.dart';
import 'package:food_app/core/auth/provider/auth_providers.dart';
import 'package:food_app/core/menu/model/model.dart';
import 'package:food_app/core/menu/widgets/grid_container.dart';

import 'package:food_app/main.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return EmailAuthScreen();
  }

  test("initializing list", () {
    List<FoodItems> filteredFoods = [FoodItems()];

    expect(filteredFoods.length, 1);
  });

  testWidgets('finds exactly one widget', (WidgetTester tester) async {
    await tester.pumpWidget(GridContainer(name: '', image: '', cuisine: ''));

    // finding GridContainer by element type
    Finder container = find.byType(GridContainer);
    expect(container, findsOneWidget);
  });
}

// MOCK WIDGET to test and check if widget testing working
class GridContainer extends StatefulWidget {
  String name;
  String cuisine;
  String image;
  GridContainer(
      {Key? key,
      required this.name,
      required this.cuisine,
      required this.image})
      : super(key: key);

  @override
  State<GridContainer> createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
    );
  }
}

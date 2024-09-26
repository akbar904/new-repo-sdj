
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animal_switcher/widgets/animal_text.dart';

void main() {
	group('AnimalText Widget', () {
		testWidgets('displays the correct text and icon for Cat', (WidgetTester tester) async {
			// Arrange
			const text = 'Cat';
			const icon = Icons.access_time;

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: AnimalText(text: text, icon: icon),
					),
				),
			);

			// Assert
			expect(find.text(text), findsOneWidget);
			expect(find.byIcon(icon), findsOneWidget);
		});

		testWidgets('displays the correct text and icon for Dog', (WidgetTester tester) async {
			// Arrange
			const text = 'Dog';
			const icon = Icons.person;

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: AnimalText(text: text, icon: icon),
					),
				),
			);

			// Assert
			expect(find.text(text), findsOneWidget);
			expect(find.byIcon(icon), findsOneWidget);
		});
	});
}

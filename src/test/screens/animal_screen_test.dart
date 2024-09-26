
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:animal_switcher/screens/animal_screen.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/models/animal_model.dart';
import 'package:animal_switcher/widgets/animal_text.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('AnimalScreen Widget Tests', () {
		testWidgets('Initial state shows Cat with clock icon', (WidgetTester tester) async {
			final mockCubit = MockAnimalCubit();
			when(() => mockCubit.state).thenReturn(Animal(name: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => mockCubit,
						child: AnimalScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('Tap on text toggles to Dog with person icon', (WidgetTester tester) async {
			final mockCubit = MockAnimalCubit();
			when(() => mockCubit.state).thenReturn(Animal(name: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => mockCubit,
						child: AnimalScreen(),
					),
				),
			);

			when(() => mockCubit.toggleAnimal()).thenAnswer((_) {
				when(() => mockCubit.state).thenReturn(Animal(name: 'Dog', icon: Icons.person));
			});

			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			verify(() => mockCubit.toggleAnimal()).called(1);
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}

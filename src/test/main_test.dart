
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:animal_switcher/main.dart';

// Mock AnimalCubit for Bloc testing
class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('AnimalCubits', () {
		blocTest<AnimalCubit, Animal>(
			'emits [Dog] when toggleAnimal is called after initial state Cat',
			build: () => AnimalCubit(),
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [Animal(name: 'Dog', icon: Icons.person)],
		);

		blocTest<AnimalCubit, Animal>(
			'emits [Cat] when toggleAnimal is called after state Dog',
			build: () => AnimalCubit()..emit(Animal(name: 'Dog', icon: Icons.person)),
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [Animal(name: 'Cat', icon: Icons.access_time)],
		);
	});

	group('Widgets', () {
		testWidgets('AnimalScreen shows Cat by default', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('AnimalScreen shows Dog after tapping', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			await tester.tap(find.text('Cat'));
			await tester.pump();
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}

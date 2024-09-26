
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/models/animal_model.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('initial state is Cat with clock icon', () {
			expect(animalCubit.state, Animal(name: 'Cat', icon: Icons.access_time));
		});

		blocTest<AnimalCubit, Animal>(
			'emits Dog with person icon when toggleAnimal is called from Cat state',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [Animal(name: 'Dog', icon: Icons.person)],
		);

		blocTest<AnimalCubit, Animal>(
			'emits Cat with clock icon when toggleAnimal is called from Dog state',
			build: () => animalCubit,
			act: (cubit) {
				cubit.toggleAnimal(); // First toggle to Dog
				cubit.toggleAnimal(); // Second toggle back to Cat
			},
			expect: () => [
				Animal(name: 'Dog', icon: Icons.person),
				Animal(name: 'Cat', icon: Icons.access_time),
			],
		);
	});
}

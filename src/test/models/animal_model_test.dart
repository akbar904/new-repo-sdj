
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animal_switcher/models/animal_model.dart';

void main() {
	group('Animal Model Tests', () {
		test('should create Animal model with correct properties', () {
			// Arrange
			const String expectedName = 'Cat';
			const IconData expectedIcon = Icons.access_time;

			// Act
			final animal = Animal(name: expectedName, icon: expectedIcon);

			// Assert
			expect(animal.name, expectedName);
			expect(animal.icon, expectedIcon);
		});

		test('should serialize Animal model to JSON', () {
			// Arrange
			const animal = Animal(name: 'Dog', icon: Icons.person);
			const expectedJson = {
				'name': 'Dog',
				'icon': 'Icons.person'
			};

			// Act
			final json = animal.toJson();

			// Assert
			expect(json, expectedJson);
		});

		test('should deserialize JSON to Animal model', () {
			// Arrange
			const json = {
				'name': 'Cat',
				'icon': 'Icons.access_time'
			};
			const expectedAnimal = Animal(name: 'Cat', icon: Icons.access_time);

			// Act
			final animal = Animal.fromJson(json);

			// Assert
			expect(animal.name, expectedAnimal.name);
			expect(animal.icon, expectedAnimal.icon);
		});
	});
}


import 'package:flutter/material.dart';

class Animal {
	final String name;
	final IconData icon;

	const Animal({required this.name, required this.icon});

	factory Animal.fromJson(Map<String, dynamic> json) {
		return Animal(
			name: json['name'],
			icon: _iconFromString(json['icon']),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'name': name,
			'icon': _iconToString(icon),
		};
	}

	static IconData _iconFromString(String iconStr) {
		switch (iconStr) {
			case 'Icons.access_time':
				return Icons.access_time;
			case 'Icons.person':
				return Icons.person;
			default:
				throw ArgumentError('Unknown icon string');
		}
	}

	static String _iconToString(IconData icon) {
		if (icon == Icons.access_time) {
			return 'Icons.access_time';
		} else if (icon == Icons.person) {
			return 'Icons.person';
		} else {
			throw ArgumentError('Unknown icon');
		}
	}
}

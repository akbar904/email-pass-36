
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_cubit_app/models/user_model.dart';

void main() {
	group('UserModel', () {
		test('should correctly serialize from JSON', () {
			final json = {
				'email': 'test@example.com',
				'password': 'password123'
			};

			final userModel = UserModel.fromJson(json);

			expect(userModel.email, 'test@example.com');
			expect(userModel.password, 'password123');
		});

		test('should correctly deserialize to JSON', () {
			final userModel = UserModel(
				email: 'test@example.com',
				password: 'password123',
			);

			final json = userModel.toJson();

			expect(json, {
				'email': 'test@example.com',
				'password': 'password123'
			});
		});

		test('should have correct equality and hashcode', () {
			final userModel1 = UserModel(
				email: 'test@example.com',
				password: 'password123',
			);

			final userModel2 = UserModel(
				email: 'test@example.com',
				password: 'password123',
			);

			final userModel3 = UserModel(
				email: 'different@example.com',
				password: 'password123',
			);

			expect(userModel1, userModel2);
			expect(userModel1, isNot(userModel3));
			expect(userModel1.hashCode, userModel2.hashCode);
		});
	});
}

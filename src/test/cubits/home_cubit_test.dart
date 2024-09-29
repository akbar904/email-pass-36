
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_cubit_app/cubits/home_cubit.dart';

// Mocking the HomeCubit for testing
class MockHomeCubit extends MockCubit<void> implements HomeCubit {}

void main() {
	group('HomeCubit Tests', () {
		late HomeCubit homeCubit;

		setUp(() {
			homeCubit = HomeCubit();
		});

		tearDown(() {
			homeCubit.close();
		});

		blocTest<HomeCubit, void>(
			'emit nothing when initialized',
			build: () => homeCubit,
			expect: () => [],
		);

		blocTest<HomeCubit, void>(
			'emits nothing on logout call',
			build: () => homeCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [],
		);
	});
}

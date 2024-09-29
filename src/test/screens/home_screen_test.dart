
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:simple_cubit_app/screens/home_screen.dart';
import 'package:simple_cubit_app/cubits/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockHomeCubit extends MockCubit<void> implements HomeCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('should display a logout button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<HomeCubit>(
						create: (_) => MockHomeCubit(),
						child: HomeScreen(),
					),
				),
			);
			
			expect(find.text('Logout'), findsOneWidget);
		});
	});

	group('HomeCubit Tests', () {
		late HomeCubit homeCubit;

		setUp(() {
			homeCubit = MockHomeCubit();
		});

		blocTest<HomeCubit, void>(
			'should emit nothing on initial state',
			build: () => homeCubit,
			expect: () => [],
		);

		blocTest<HomeCubit, void>(
			'should call logout method',
			build: () => homeCubit,
			act: (cubit) => cubit.logout(),
			verify: (_) {
				verify(() => homeCubit.logout()).called(1);
			},
		);
	});
}

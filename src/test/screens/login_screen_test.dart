
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.simple_cubit_app/screens/login_screen.dart';

// Mocking the LoginCubit
class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		late MockLoginCubit mockLoginCubit;

		setUp(() {
			mockLoginCubit = MockLoginCubit();
		});

		testWidgets('renders LoginScreen with email and password fields', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<LoginCubit>(
						create: (_) => mockLoginCubit,
						child: LoginScreen(),
					),
				),
			);

			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
			expect(find.byType(TextField), findsNWidgets(2));
		});

		testWidgets('renders Login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<LoginCubit>(
						create: (_) => mockLoginCubit,
						child: LoginScreen(),
					),
				),
			);

			expect(find.text('Login'), findsOneWidget);
			expect(find.byType(ElevatedButton), findsOneWidget);
		});

		testWidgets('calls login on LoginCubit when login button is pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<LoginCubit>(
						create: (_) => mockLoginCubit,
						child: LoginScreen(),
					),
				),
			);

			await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
			await tester.enterText(find.byKey(Key('passwordField')), 'password');
			await tester.tap(find.text('Login'));
			await tester.pump();

			verify(() => mockLoginCubit.login('test@example.com', 'password')).called(1);
		});
	});
}

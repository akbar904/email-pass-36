
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_cubit_app/main.dart';

class MockLoginCubit extends Mock implements LoginCubit {}
class MockHomeCubit extends Mock implements HomeCubit {}

void main() {
  group('MyApp', () {
    testWidgets('renders LoginScreen initially', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.byType(LoginScreen), findsOneWidget);
    });
  });

  group('LoginCubit', () {
    late LoginCubit loginCubit;

    setUp(() {
      loginCubit = MockLoginCubit();
    });

    blocTest<LoginCubit, LoginState>(
      'emits [] when nothing is added',
      build: () => loginCubit,
      expect: () => [],
    );

    blocTest<LoginCubit, LoginState>(
      'emits [LoginLoading, LoginSuccess] when login is successful',
      build: () => loginCubit,
      act: (cubit) => cubit.login('email', 'password'),
      expect: () => [LoginLoading(), LoginSuccess()],
    );

    blocTest<LoginCubit, LoginState>(
      'emits [LoginLoading, LoginFailure] when login fails',
      build: () => loginCubit,
      act: (cubit) => cubit.login('wrong_email', 'wrong_password'),
      expect: () => [LoginLoading(), LoginFailure()],
    );
  });

  group('HomeCubit', () {
    late HomeCubit homeCubit;

    setUp(() {
      homeCubit = MockHomeCubit();
    });

    blocTest<HomeCubit, HomeState>(
      'emits [HomeInitial] when nothing is added',
      build: () => homeCubit,
      expect: () => [],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [LogoutSuccess] when logout is called',
      build: () => homeCubit,
      act: (cubit) => cubit.logout(),
      expect: () => [LogoutSuccess()],
    );
  });

  group('Main', () {
    testWidgets('MyApp initializes correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.byType(MyApp), findsOneWidget);
    });

    test('main function runs without errors', () {
      expect(() => main(), returnsNormally);
    });
  });
}

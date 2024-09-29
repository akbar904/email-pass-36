
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {}

class LoginCubit extends Cubit<LoginState> {
	LoginCubit() : super(LoginInitial());

	void login(String email, String password) async {
		emit(LoginLoading());
		await Future.delayed(Duration(seconds: 1)); // Simulate network call
		if (email == 'test@example.com' && password == 'password123') {
			emit(LoginSuccess());
		} else {
			emit(LoginFailure());
		}
	}
}

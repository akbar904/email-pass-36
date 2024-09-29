
import 'dart:convert';

class UserModel {
	final String email;
	final String password;

	UserModel({required this.email, required this.password});

	// Factory constructor to create a UserModel from JSON
	factory UserModel.fromJson(Map<String, dynamic> json) {
		return UserModel(
			email: json['email'],
			password: json['password'],
		);
	}

	// Method to convert UserModel to JSON
	Map<String, dynamic> toJson() {
		return {
			'email': email,
			'password': password,
		};
	}

	// Override equality operator
	@override
	bool operator ==(Object other) {
		if (identical(this, other)) return true;
		if (runtimeType != other.runtimeType) return false;
		final UserModel otherUser = other as UserModel;
		return email == otherUser.email && password == otherUser.password;
	}

	// Override hashcode
	@override
	int get hashCode => email.hashCode ^ password.hashCode;
}

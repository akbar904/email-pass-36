
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/login_cubit.dart';

class LoginScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					children: [
						TextField(
							key: Key('emailField'),
							decoration: InputDecoration(
								labelText: 'Email',
							),
						),
						TextField(
							key: Key('passwordField'),
							decoration: InputDecoration(
								labelText: 'Password',
							),
							obscureText: true,
						),
						SizedBox(height: 20),
						ElevatedButton(
							onPressed: () {
								final email = (context.findRenderObject() as RenderEditable).text;
								final password = (context.findRenderObject() as RenderEditable).text;
								context.read<LoginCubit>().login(email, password);
							},
							child: Text('Login'),
						),
					],
				),
			),
		);
	}
}

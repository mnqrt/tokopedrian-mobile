import 'package:tokopedrian_mobile/screens/menu.dart';
import 'package:tokopedrian_mobile/screens/register.dart';
// import 'package:shopping_list/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
	runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
	const LoginApp({super.key});

	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		title: 'Login',
		theme: ThemeData(
		primarySwatch: Colors.lightGreen,
		),
		home: const LoginPage(),
	);
	}
}

class LoginPage extends StatefulWidget {	
	const LoginPage({super.key});

	@override
	_LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
	final TextEditingController _usernameController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		final request = context.watch<CookieRequest>();
		return Scaffold(
		appBar: AppBar(
			title: const Text('Login'),
		),
		body: Container(
			decoration: const BoxDecoration(
				gradient: LinearGradient(
					begin: Alignment.topLeft,
					end: Alignment.bottomRight,
					colors: [
				Color.fromARGB(255, 173, 185, 7),
				Color.fromARGB(255, 78, 212, 227)
				])),
			padding: const EdgeInsets.all(16.0),
			child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: [
				const Stack(
					children: [
						Center(
						child: Text('Login Account',
							textAlign: TextAlign.center,
							style: TextStyle(
								fontSize: 40,
								color: Colors.white,
								fontWeight: FontWeight.bold)),
						),
					],
				),
				const SizedBox(height: 20.0),
				TextField(
					controller: _usernameController,
					decoration: const InputDecoration(
						labelText: 'Username',
						labelStyle: TextStyle(color: Colors.white),
						hintStyle: const TextStyle(color: Colors.white)),
				),
				const SizedBox(height: 12.0),
				TextField(
					controller: _passwordController,
					decoration: const InputDecoration(
						labelText: 'Password',
						labelStyle: TextStyle(color: Colors.white),
						hintStyle: const TextStyle(color: Colors.white)),
						obscureText: true,
				),
				const SizedBox(height: 24.0),
				ElevatedButton(
					onPressed: () async {
						String username = _usernameController.text;
						String password = _passwordController.text;

						// Cek kredensial
						// TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
						// Untuk menyambungkan Android emulator dengan Django pada localhost,
						// gunakan URL http://10.0.2.2/
						final response =
							await request.login("http://127.0.0.1:8000/auth/login/", {
								'username': username,
								'password': password,
							});

						if (request.loggedIn) {
						String message = response['message'];
						String uname = response['username'];
						
						// ignore: use_build_context_synchronously
						Navigator.pushReplacement(
							context,
							MaterialPageRoute(builder: (context) => MyHomePage()),
						);
						ScaffoldMessenger.of(context)
							..hideCurrentSnackBar()
							..showSnackBar(SnackBar(
								content: Text("$message Selamat datang, $uname.")));
						} else {
							// ignore: use_build_context_synchronously
							showDialog(
								context: context,
								builder: (context) => AlertDialog(
									title: const Text('Login Gagal'),
									content: Text(response['message']),
									actions: [
										TextButton(
											child: const Text('OK'),
											onPressed: () {
												Navigator.pop(context);
											},
										),
									],
								),
							);
						}
					},
					child: const Text('Login'),
				),
				const SizedBox(height: 24.0),
				GestureDetector(
					onTap: () {
						// Route menu ke counter
						Navigator.pushReplacement(
						context,
						MaterialPageRoute(builder: (context) => const RegisterPage()),
						);
					},
					child: Container(
						decoration: const BoxDecoration(
							border: Border(
								bottom: BorderSide(
									width: 1, color: Color.fromARGB(255, 10, 7, 7)))),
						child: const Text(
						'Create New Account',
						style: TextStyle(
							fontSize: 17,
							color: Color.fromARGB(255, 230, 211, 211),
							height: 1.5),
						),
					),
				),
			],
			),
		),
		);
	}
}
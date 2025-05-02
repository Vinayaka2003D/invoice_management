// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   Duration get loadingTime => const Duration(milliseconds: 2000);

//   Future<String?> _authUser(LoginData data) async {
//     const String apiUrl =
//         "http://your_server_ip/login_api/user_login.php"; // Replace with your server IP
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({'username': data.name, 'password': data.password}),
//       );

//       if (response.statusCode == 200) {
//         final result = jsonDecode(response.body);
//         if (result['loginStatus'] == true) {
//           return null; // Success
//         } else {
//           return result['message'] ?? 'Invalid credentials';
//         }
//       } else {
//         return 'Server error';
//       }
//     } catch (e) {
//       return 'Network error: $e';
//     }
//   }

//   Future<String?> _signupUser(SignupData data) async {
//     const String apiUrl =
//         "http://your_server_ip/login_api/user_signup.php"; // Replace with your server IP
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({'username': data.name, 'password': data.password}),
//       );

//       if (response.statusCode == 200) {
//         final result = jsonDecode(response.body);
//         if (result['signupStatus'] == true) {
//           return null; // Success
//         } else {
//           return result['message'] ?? 'Signup failed';
//         }
//       } else {
//         return 'Server error';
//       }
//     } catch (e) {
//       return 'Network error: $e';
//     }
//   }

//   Future<String?> _recoverPassword(String email) async {
//     const String apiUrl =
//         "http://your_server_ip/login_api/forgot_password.php"; // Replace with your server IP
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({'email': email}),
//       );

//       if (response.statusCode == 200) {
//         final result = jsonDecode(response.body);
//         if (result['success'] == true) {
//           return null; // Success
//         } else {
//           return result['message'] ?? 'Failed to send reset email';
//         }
//       } else {
//         return 'Server error';
//       }
//     } catch (e) {
//       return 'Network error: $e';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFFE6F0FA), // Subtle light blue
//               Colors.white,
//             ],
//           ),
//         ),
//         child: FlutterLogin(
//           logo: const AssetImage('assets/images/logo.png'),
//           //title: 'Login',
//           onLogin: _authUser,
//           onSignup: _signupUser,
//           onRecoverPassword: _recoverPassword,
//           theme: LoginTheme(
//             primaryColor: const Color.fromARGB(255, 165, 198, 255),
//             accentColor: Colors.white,
//             cardTheme: const CardTheme(
//               color: Colors.white,
//               elevation: 8,
//               margin: EdgeInsets.symmetric(horizontal: 24),
//             ),
//             titleStyle: const TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//               color: Color.fromARGB(255, 59, 67, 80),
//             ),
//           ),
//           messages: LoginMessages(
//             recoverPasswordDescription:
//                 'Enter your email to receive a password reset link.',
//           ),
//         ),
//       ),
//     );
//   }
// }

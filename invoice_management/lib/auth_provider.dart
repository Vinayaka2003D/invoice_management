// // // import 'dart:convert';
// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// // // class AuthProvider with ChangeNotifier {
// // //   final _storage = FlutterSecureStorage();
// // //   String? _token;
// // //   String? _userId;
// // //   String? _email;
// // //   String? _fullName;
// // //   int _regStep = 1;
// // //   String? _regEmail;
// // //   String? _regName;

// // //   bool get isAuthenticated => _token != null;
// // //   int get regStep => _regStep;
// // //   String? get regEmail => _regEmail;
// // //   String? get regName => _regName;

// // //   Future<Map<String, dynamic>> login(
// // //     String email,
// // //     String password,
// // //     bool remember,
// // //   ) async {
// // //     final response = await http.post(
// // //       Uri.parse('http://192.168.29.77/invoice_settings/login.php'),
// // //       headers: {'Content-Type': 'application/json'},
// // //       body: jsonEncode({
// // //         'email': email,
// // //         'password': password,
// // //         'remember': remember,
// // //       }),
// // //     );

// // //     final data = jsonDecode(response.body);
// // //     if (data['status'] == 'success') {
// // //       _userId = data['user_id'];
// // //       _email = data['email'];
// // //       _fullName = data['full_name'];
// // //       if (remember) {
// // //         await _storage.write(key: 'remember_token', value: data['token']);
// // //         _token = data['token'];
// // //       }
// // //       notifyListeners();
// // //     }
// // //     return data;
// // //   }

// // //   Future<Map<String, dynamic>> registerStep1(
// // //     String fullName,
// // //     String email,
// // //   ) async {
// // //     final response = await http.post(
// // //       Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
// // //       headers: {'Content-Type': 'application/json'},
// // //       body: jsonEncode({
// // //         'step': 'step1',
// // //         'full_name': fullName,
// // //         'email': email,
// // //       }),
// // //     );

// // //     final data = jsonDecode(response.body);
// // //     if (data['status'] == 'success') {
// // //       _regStep = 2;
// // //       _regEmail = email;
// // //       _regName = fullName;
// // //       notifyListeners();
// // //     }
// // //     return data;
// // //   }

// // //   Future<Map<String, dynamic>> resendOTP() async {
// // //     final response = await http.post(
// // //       Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
// // //       headers: {'Content-Type': 'application/json'},
// // //       body: jsonEncode({'step': 'resend_otp'}),
// // //     );

// // //     final data = jsonDecode(response.body);
// // //     return data;
// // //   }

// // //   Future<Map<String, dynamic>> verifyOTP(String otp) async {
// // //     final response = await http.post(
// // //       Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
// // //       headers: {'Content-Type': 'application/json'},
// // //       body: jsonEncode({'step': 'step2', 'otp': otp}),
// // //     );

// // //     final data = jsonDecode(response.body);
// // //     if (data['status'] == 'success') {
// // //       _regStep = 3;
// // //       notifyListeners();
// // //     }
// // //     return data;
// // //   }

// // //   Future<Map<String, dynamic>> completeRegistration(
// // //     String password,
// // //     String confirmPassword,
// // //     bool agreeTerms,
// // //   ) async {
// // //     final response = await http.post(
// // //       Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
// // //       headers: {'Content-Type': 'application/json'},
// // //       body: jsonEncode({
// // //         'step': 'step3',
// // //         'password': password,
// // //         'confirm_password': confirmPassword,
// // //         'agree_terms': agreeTerms,
// // //       }),
// // //     );

// // //     final data = jsonDecode(response.body);
// // //     if (data['status'] == 'success') {
// // //       _userId = data['user_id'];
// // //       _email = _regEmail;
// // //       _fullName = _regName;
// // //       _regStep = 1;
// // //       _regEmail = null;
// // //       _regName = null;
// // //       notifyListeners();
// // //     }
// // //     return data;
// // //   }

// // //   Future<Map<String, dynamic>> forgotPassword(String email) async {
// // //     final response = await http.post(
// // //       Uri.parse('http://192.168.29.77/invoice_settings/forgot_password.php'),
// // //       headers: {'Content-Type': 'application/json'},
// // //       body: jsonEncode({'email': email}),
// // //     );

// // //     return jsonDecode(response.body);
// // //   }

// // //   Future<Map<String, dynamic>> resetPassword(
// // //     String token,
// // //     String password,
// // //     String confirmPassword,
// // //   ) async {
// // //     final response = await http.post(
// // //       Uri.parse('http://192.168.29.77/invoice_settings/reset_password.php'),
// // //       headers: {'Content-Type': 'application/json'},
// // //       body: jsonEncode({
// // //         'token': token,
// // //         'password': password,
// // //         'confirm_password': confirmPassword,
// // //       }),
// // //     );

// // //     return jsonDecode(response.body);
// // //   }

// // //   void logout() {
// // //     _token = null;
// // //     _userId = null;
// // //     _email = null;
// // //     _fullName = null;
// // //     _storage.delete(key: 'remember_token');
// // //     notifyListeners();
// // //   }
// // // }
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// // class AuthProvider with ChangeNotifier {
// //   final _storage = FlutterSecureStorage();
// //   String? _token;
// //   String? _userId;
// //   String? _email;
// //   String? _fullName;
// //   int _regStep = 1;
// //   String? _regEmail;
// //   String? _regName;

// //   bool get isAuthenticated => _token != null;
// //   int get regStep => _regStep;
// //   String? get regEmail => _regEmail;
// //   String? get regName => _regName;
// //   String? get token => _token;
// //   String? get userId => _userId;
// //   String? get email => _email;
// //   String? get fullName => _fullName;

// //   AuthProvider() {
// //     _loadUserData();
// //   }

// //   Future<void> _loadUserData() async {
// //     _token = await _storage.read(key: 'remember_token');
// //     _userId = await _storage.read(key: 'user_id');
// //     _email = await _storage.read(key: 'email');
// //     _fullName = await _storage.read(key: 'full_name');
// //     if (_token != null) {
// //       notifyListeners();
// //     }
// //   }

// //   Future<Map<String, dynamic>> login(
// //     String email,
// //     String password,
// //     bool remember,
// //   ) async {
// //     final response = await http.post(
// //       Uri.parse('http://192.168.29.77/invoice_settings/login.php'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({
// //         'email': email,
// //         'password': password,
// //         'remember': remember,
// //       }),
// //     );

// //     print('Login response: ${response.body}');
// //     try {
// //       final data = jsonDecode(response.body);
// //       if (data['status'] == 'success') {
// //         _userId = data['data']['user_id'].toString();
// //         _email = data['data']['email'];
// //         _fullName = data['data']['full_name'];
// //         _token = data['data']['remember_token'];

// //         await _storage.write(key: 'user_id', value: _userId);
// //         await _storage.write(key: 'email', value: _email);
// //         await _storage.write(key: 'full_name', value: _fullName);
// //         await _storage.write(key: 'remember_token', value: _token);

// //         notifyListeners();
// //       }
// //       return data;
// //     } catch (e) {
// //       return {
// //         'status': 'error',
// //         'message': 'Invalid server response: ${response.body}',
// //       };
// //     }
// //   }

// //   Future<Map<String, dynamic>> fetchLandingData() async {
// //     if (_token == null || _userId == null) {
// //       return {'status': 'error', 'message': 'Not authenticated'};
// //     }

// //     final response = await http.get(
// //       Uri.parse('http://192.168.29.77/invoice_settings/landing.php'),
// //       headers: {
// //         'Content-Type': 'application/json',
// //         'Authorization': 'Bearer $_token',
// //         'User-ID': _userId!,
// //       },
// //     );

// //     print('Landing response: ${response.body}');
// //     try {
// //       return jsonDecode(response.body);
// //     } catch (e) {
// //       return {
// //         'status': 'error',
// //         'message': 'Invalid server response: ${response.body}',
// //       };
// //     }
// //   }

// //   Future<Map<String, dynamic>> registerStep1(
// //     String fullName,
// //     String email,
// //   ) async {
// //     final response = await http.post(
// //       Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({
// //         'step': 'step1',
// //         'full_name': fullName,
// //         'email': email,
// //       }),
// //     );

// //     final data = jsonDecode(response.body);
// //     if (data['status'] == 'success') {
// //       _regStep = 2;
// //       _regEmail = email;
// //       _regName = fullName;
// //       notifyListeners();
// //     }
// //     return data;
// //   }

// //   Future<Map<String, dynamic>> resendOTP() async {
// //     final response = await http.post(
// //       Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({'step': 'resend_otp'}),
// //     );

// //     final data = jsonDecode(response.body);
// //     return data;
// //   }

// //   Future<Map<String, dynamic>> verifyOTP(String otp) async {
// //     final response = await http.post(
// //       Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({'step': 'step2', 'otp': otp}),
// //     );

// //     final data = jsonDecode(response.body);
// //     if (data['status'] == 'success') {
// //       _regStep = 3;
// //       notifyListeners();
// //     }
// //     return data;
// //   }

// //   Future<Map<String, dynamic>> completeRegistration(
// //     String password,
// //     String confirmPassword,
// //     bool agreeTerms,
// //   ) async {
// //     final response = await http.post(
// //       Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({
// //         'step': 'step3',
// //         'password': password,
// //         'confirm_password': confirmPassword,
// //         'agree_terms': agreeTerms,
// //       }),
// //     );

// //     final data = jsonDecode(response.body);
// //     if (data['status'] == 'success') {
// //       _userId = data['user_id'].toString();
// //       _email = _regEmail;
// //       _fullName = _regName;
// //       _regStep = 1;
// //       _regEmail = null;
// //       _regName = null;

// //       await _storage.write(key: 'user_id', value: _userId);
// //       await _storage.write(key: 'email', value: _email);
// //       await _storage.write(key: 'full_name', value: _fullName);
// //       await _storage.write(key: 'remember_token', value: _token);

// //       notifyListeners();
// //     }
// //     return data;
// //   }

// //   Future<Map<String, dynamic>> forgotPassword(String email) async {
// //     final response = await http.post(
// //       Uri.parse('http://192.168.29.77/invoice_settings/forgot_password.php'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({'email': email}),
// //     );

// //     return jsonDecode(response.body);
// //   }

// //   Future<Map<String, dynamic>> resetPassword(
// //     String token,
// //     String password,
// //     String confirmPassword,
// //   ) async {
// //     final response = await http.post(
// //       Uri.parse('http://192.168.29.77/invoice_settings/reset_password.php'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({
// //         'token': token,
// //         'password': password,
// //         'confirm_password': confirmPassword,
// //       }),
// //     );

// //     return jsonDecode(response.body);
// //   }

// //   void logout() async {
// //     _token = null;
// //     _userId = null;
// //     _email = null;
// //     _fullName = null;
// //     await _storage.deleteAll();
// //     notifyListeners();
// //   }
// // }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class AuthProvider with ChangeNotifier {
//   final _storage = const FlutterSecureStorage();
//   String? _token;
//   String? _userId;
//   String? _email;
//   String? _fullName;
//   int _regStep = 1;
//   String? _regEmail;
//   String? _regName;

//   bool get isAuthenticated => _token != null;
//   int get regStep => _regStep;
//   String? get regEmail => _regEmail;
//   String? get regName => _regName;
//   String? get token => _token;
//   String? get userId => _userId;
//   String? get email => _email;
//   String? get fullName => _fullName;

//   AuthProvider() {
//     _loadUserData();
//   }

//   Future<void> _loadUserData() async {
//     _token = await _storage.read(key: 'remember_token');
//     _userId = await _storage.read(key: 'user_id');
//     _email = await _storage.read(key: 'email');
//     _fullName = await _storage.read(key: 'full_name');
//     print(
//       'Loaded from storage: token=$_token, userId=$_userId, email=$_email, fullName=$_fullName',
//     );
//     if (_token != null && _userId != null) {
//       notifyListeners();
//     }
//   }

//   Future<Map<String, dynamic>> login(
//     String email,
//     String password,
//     bool remember,
//   ) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.29.77/invoice_settings/login.php'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'email': email,
//           'password': password,
//           'remember': remember,
//         }),
//       );

//       print('Login request: email=$email, remember=$remember');
//       print('Login response status: ${response.statusCode}');
//       print('Login response body: ${response.body}');

//       final data = jsonDecode(response.body);
//       print('Parsed login response: $data');

//       if (data['status'] == 'success' && data['data'] != null) {
//         final userData = data['data'];
//         _userId = userData['user_id']?.toString();
//         _email = userData['email'];
//         _fullName = userData['full_name'];
//         _token = userData['remember_token'];

//         if (_userId == null || _token == null) {
//           print('Error: user_id or remember_token missing in response');
//           return {
//             'status': 'error',
//             'message': 'Invalid server response: missing user_id or token',
//           };
//         }

//         print(
//           'Saving to storage: userId=$_userId, email=$_email, fullName=$_fullName, token=$_token',
//         );
//         await _storage.write(key: 'user_id', value: _userId);
//         await _storage.write(key: 'email', value: _email);
//         await _storage.write(key: 'full_name', value: _fullName);
//         await _storage.write(key: 'remember_token', value: _token);

//         // Verify storage
//         final storedToken = await _storage.read(key: 'remember_token');
//         final storedUserId = await _storage.read(key: 'user_id');
//         print('Verified storage: token=$storedToken, userId=$storedUserId');

//         notifyListeners();
//         return data;
//       } else {
//         print('Login failed: ${data['message']}');
//         return data;
//       }
//     } catch (e) {
//       print('Login error: $e');
//       return {'status': 'error', 'message': 'Failed to connect to server: $e'};
//     }
//   }

//   Future<Map<String, dynamic>> fetchLandingData() async {
//     if (_token == null || _userId == null) {
//       print(
//         'fetchLandingData: Missing token or userId (token=$_token, userId=$_userId)',
//       );
//       return {'status': 'error', 'message': 'Not authenticated'};
//     }

//     try {
//       final headers = {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $_token',
//         'User-ID': _userId!,
//       };
//       print('fetchLandingData headers: $headers');

//       final response = await http.get(
//         Uri.parse('http://192.168.29.77/invoice_settings/landing.php'),
//         headers: headers,
//       );

//       print('Landing response status: ${response.statusCode}');
//       print('Landing response body: ${response.body}');

//       final data = jsonDecode(response.body);
//       print('Parsed landing response: $data');
//       return data;
//     } catch (e) {
//       print('fetchLandingData error: $e');
//       return {'status': 'error', 'message': 'Failed to fetch data: $e'};
//     }
//   }

//   Future<Map<String, dynamic>> registerStep1(
//     String fullName,
//     String email,
//   ) async {
//     final response = await http.post(
//       Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'step': 'step1',
//         'full_name': fullName,
//         'email': email,
//       }),
//     );

//     final data = jsonDecode(response.body);
//     if (data['status'] == 'success') {
//       _regStep = 2;
//       _regEmail = email;
//       _regName = fullName;
//       notifyListeners();
//     }
//     return data;
//   }

//   Future<Map<String, dynamic>> resendOTP() async {
//     final response = await http.post(
//       Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'step': 'resend_otp'}),
//     );

//     final data = jsonDecode(response.body);
//     return data;
//   }

//   Future<Map<String, dynamic>> verifyOTP(String otp) async {
//     final response = await http.post(
//       Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'step': 'step2', 'otp': otp}),
//     );

//     final data = jsonDecode(response.body);
//     if (data['status'] == 'success') {
//       _regStep = 3;
//       notifyListeners();
//     }
//     return data;
//   }

//   Future<Map<String, dynamic>> completeRegistration(
//     String password,
//     String confirmPassword,
//     bool agreeTerms,
//   ) async {
//     final response = await http.post(
//       Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'step': 'step3',
//         'password': password,
//         'confirm_password': confirmPassword,
//         'agree_terms': agreeTerms,
//       }),
//     );

//     final data = jsonDecode(response.body);
//     if (data['status'] == 'success') {
//       _userId = data['user_id'].toString();
//       _email = _regEmail;
//       _fullName = _regName;
//       _regStep = 1;
//       _regEmail = null;
//       _regName = null;

//       await _storage.write(key: 'user_id', value: _userId);
//       await _storage.write(key: 'email', value: _email);
//       await _storage.write(key: 'full_name', value: _fullName);
//       await _storage.write(key: 'remember_token', value: _token);

//       notifyListeners();
//     }
//     return data;
//   }

//   Future<Map<String, dynamic>> forgotPassword(String email) async {
//     final response = await http.post(
//       Uri.parse('http://192.168.29.77/invoice_settings/forgot_password.php'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email}),
//     );

//     return jsonDecode(response.body);
//   }

//   Future<Map<String, dynamic>> resetPassword(
//     String token,
//     String password,
//     String confirmPassword,
//   ) async {
//     final response = await http.post(
//       Uri.parse('http://192.168.29.77/invoice_settings/reset_password.php'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'token': token,
//         'password': password,
//         'confirm_password': confirmPassword,
//       }),
//     );

//     return jsonDecode(response.body);
//   }

//   void logout() async {
//     _token = null;
//     _userId = null;
//     _email = null;
//     _fullName = null;
//     await _storage.deleteAll();
//     print('Logged out: Cleared storage');
//     notifyListeners();
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  String? _token;
  String? _userId;
  String? _email;
  String? _fullName;
  int _regStep = 1;
  String? _regEmail;
  String? _regName;

  bool get isAuthenticated => _token != null;
  int get regStep => _regStep;
  String? get regEmail => _regEmail;
  String? get regName => _regName;
  String? get token => _token;
  String? get userId => _userId;
  String? get email => _email;
  String? get fullName => _fullName;

  AuthProvider() {
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    _token = await _storage.read(key: 'remember_token');
    _userId = await _storage.read(key: 'user_id');
    _email = await _storage.read(key: 'email');
    _fullName = await _storage.read(key: 'full_name');
    print(
      'Loaded from storage: token=$_token, userId=$_userId, email=$_email, fullName=$_fullName',
    );
    if (_token != null && _userId != null) {
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> login(
    String email,
    String password,
    bool remember,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.29.77/invoice_settings/login.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'remember': remember,
        }),
      );

      print('Login request: email=$email, remember=$remember');
      print('Login response status: ${response.statusCode}');
      print('Login response body: ${response.body}');

      final data = jsonDecode(response.body);
      print('Parsed login response: $data');

      if (data['status'] == 'success' && data['data'] != null) {
        final userData = data['data'];
        _userId = userData['user_id']?.toString();
        _email = userData['email'];
        _fullName = userData['full_name'];
        _token = userData['remember_token']; // May be null if remember=false

        if (_userId == null) {
          print('Error: user_id missing in response');
          return {
            'status': 'error',
            'message': 'Invalid server response: missing user_id',
          };
        }

        print(
          'Saving to storage: userId=$_userId, email=$_email, fullName=$_fullName, token=$_token',
        );
        await _storage.write(key: 'user_id', value: _userId);
        await _storage.write(key: 'email', value: _email);
        await _storage.write(key: 'full_name', value: _fullName);
        if (_token != null) {
          await _storage.write(key: 'remember_token', value: _token);
        } else {
          await _storage.delete(key: 'remember_token');
        }

        // Verify storage
        final storedToken = await _storage.read(key: 'remember_token');
        final storedUserId = await _storage.read(key: 'user_id');
        print('Verified storage: token=$storedToken, userId=$storedUserId');

        notifyListeners();
        return data;
      } else {
        print('Login failed: ${data['message']}');
        return data;
      }
    } catch (e) {
      print('Login error: $e');
      return {'status': 'error', 'message': 'Failed to connect to server: $e'};
    }
  }

  Future<Map<String, dynamic>> fetchLandingData() async {
    if (_token == null || _userId == null) {
      print(
        'fetchLandingData: Missing token or userId (token=$_token, userId=$_userId)',
      );
      return {
        'status': 'error',
        'message': 'Not authenticated',
        'redirect': 'login.php',
      };
    }

    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
        'User-ID': _userId!,
      };
      print('fetchLandingData headers: $headers');

      final response = await http.get(
        Uri.parse('http://192.168.29.77/invoice_settings/landing.php'),
        headers: headers,
      );

      print('Landing response status: ${response.statusCode}');
      print('Landing response body: ${response.body}');

      final data = jsonDecode(response.body);
      print('Parsed landing response: $data');
      return data;
    } catch (e) {
      print('fetchLandingData error: $e');
      return {'status': 'error', 'message': 'Failed to fetch data: $e'};
    }
  }

  Future<Map<String, dynamic>> registerStep1(
    String fullName,
    String email,
  ) async {
    final response = await http.post(
      Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'step': 'step1',
        'full_name': fullName,
        'email': email,
      }),
    );

    final data = jsonDecode(response.body);
    if (data['status'] == 'success') {
      _regStep = 2;
      _regEmail = email;
      _regName = fullName;
      notifyListeners();
    }
    return data;
  }

  Future<Map<String, dynamic>> resendOTP() async {
    final response = await http.post(
      Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'step': 'resend_otp'}),
    );

    final data = jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> verifyOTP(String otp) async {
    final response = await http.post(
      Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'step': 'step2', 'otp': otp}),
    );

    final data = jsonDecode(response.body);
    if (data['status'] == 'success') {
      _regStep = 3;
      notifyListeners();
    }
    return data;
  }

  Future<Map<String, dynamic>> completeRegistration(
    String password,
    String confirmPassword,
    bool agreeTerms,
  ) async {
    final response = await http.post(
      Uri.parse('http://192.168.29.77/invoice_settings/register.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'step': 'step3',
        'password': password,
        'confirm_password': confirmPassword,
        'agree_terms': agreeTerms,
      }),
    );

    final data = jsonDecode(response.body);
    if (data['status'] == 'success') {
      _userId = data['user_id'].toString();
      _email = _regEmail;
      _fullName = _regName;
      _regStep = 1;
      _regEmail = null;
      _regName = null;

      await _storage.write(key: 'user_id', value: _userId);
      await _storage.write(key: 'email', value: _email);
      await _storage.write(key: 'full_name', value: _fullName);
      await _storage.write(key: 'remember_token', value: _token);

      notifyListeners();
    }
    return data;
  }

  Future<Map<String, dynamic>> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse('http://192.168.29.77/invoice_settings/forgot_password.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> resetPassword(
    String token,
    String password,
    String confirmPassword,
  ) async {
    final response = await http.post(
      Uri.parse('http://192.168.29.77/invoice_settings/reset_password.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'token': token,
        'password': password,
        'confirm_password': confirmPassword,
      }),
    );

    return jsonDecode(response.body);
  }

  void logout() async {
    _token = null;
    _userId = null;
    _email = null;
    _fullName = null;
    await _storage.deleteAll();
    print('Logged out: Cleared storage');
    notifyListeners();
  }
}

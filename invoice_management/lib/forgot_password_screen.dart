// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../auth_provider.dart';

// class ForgotPasswordScreen extends StatefulWidget {
//   @override
//   _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   final _emailController = TextEditingController();
//   bool _isLoading = false;
//   String? _errorMessage;
//   String? _successMessage;

//   void _sendResetLink() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//       _successMessage = null;
//     });

//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     final result = await authProvider.forgotPassword(
//       _emailController.text.trim(),
//     );

//     setState(() {
//       _isLoading = false;
//       if (result['status'] == 'error') {
//         _errorMessage = result['message'];
//       } else {
//         _successMessage = result['message'];
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFF5E5CE6), Color(0xFF4B48BF)],
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(16.0),
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               elevation: 10,
//               child: Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     CircleAvatar(
//                       radius: 35,
//                       backgroundColor: Colors.white,
//                       child: Icon(
//                         Icons.key,
//                         size: 30,
//                         color: Color(0xFF5E5CE6),
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Forgot Password',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'Enter your email to reset your password',
//                       style: TextStyle(color: Colors.grey[600]),
//                     ),
//                     SizedBox(height: 20),
//                     if (_errorMessage != null)
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 16),
//                         child: Text(
//                           _errorMessage!,
//                           style: TextStyle(color: Colors.red),
//                         ),
//                       ),
//                     if (_successMessage != null)
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 16),
//                         child: Text(
//                           _successMessage!,
//                           style: TextStyle(color: Colors.green),
//                         ),
//                       ),
//                     TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         prefixIcon: Icon(Icons.email),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     _isLoading
//                         ? CircularProgressIndicator()
//                         : ElevatedButton(
//                           onPressed: _sendResetLink,
//                           child: Text('Send Reset Link'),
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: Size(double.infinity, 50),
//                           ),
//                         ),
//                     SizedBox(height: 16),
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: Text('Back to Login'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth_provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  void _requestReset() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final result = await authProvider.forgotPassword(
      _emailController.text.trim(),
    );

    setState(() {
      _isLoading = false;
      if (result['status'] == 'error') {
        _errorMessage = result['message'];
      } else {
        _successMessage = result['message'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF5E5CE6), Color(0xFF4B48BF)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.lock_reset,
                        size: 30,
                        color: Color(0xFF5E5CE6),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Enter your email to reset your password',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 20),
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    if (_successMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          _successMessage!,
                          style: const TextStyle(color: Colors.green),
                        ),
                      ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                          onPressed: _requestReset,
                          child: const Text('SEND RESET LINK'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                          ),
                        ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed:
                          () =>
                              Navigator.pushReplacementNamed(context, '/login'),
                      child: const Text('Back to Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

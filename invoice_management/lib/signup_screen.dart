// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../auth_provider.dart';

// class SignupScreen extends StatefulWidget {
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _fullNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _otpController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   bool _agreeTerms = false;
//   bool _isLoading = false;
//   String? _errorMessage;
//   String? _successMessage;

//   void _submitStep1(BuildContext context) async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//       _successMessage = null;
//     });

//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     final result = await authProvider.registerStep1(
//       _fullNameController.text.trim(),
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

//   void _resendOTP(BuildContext context) async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//       _successMessage = null;
//     });

//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     final result = await authProvider.resendOTP();

//     setState(() {
//       _isLoading = false;
//       if (result['status'] == 'error') {
//         _errorMessage = result['message'];
//       } else {
//         _successMessage = result['message'];
//       }
//     });
//   }

//   void _submitStep2(BuildContext context) async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//       _successMessage = null;
//     });

//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     final result = await authProvider.verifyOTP(_otpController.text.trim());

//     setState(() {
//       _isLoading = false;
//       if (result['status'] == 'error') {
//         _errorMessage = result['message'];
//       } else {
//         _successMessage = result['message'];
//       }
//     });
//   }

//   void _submitStep3(BuildContext context) async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//       _successMessage = null;
//     });

//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     final result = await authProvider.completeRegistration(
//       _passwordController.text,
//       _confirmPasswordController.text,
//       _agreeTerms,
//     );

//     setState(() {
//       _isLoading = false;
//       if (result['status'] == 'error') {
//         _errorMessage = result['message'];
//       } else {
//         Navigator.pushReplacementNamed(context, '/home');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
//     final step = authProvider.regStep;

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFF8F94FB), Color(0xFF4E54C8)],
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(16.0),
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
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
//                         Icons.person_add,
//                         size: 30,
//                         color: Color(0xFF4E54C8),
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Create an Account',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'Join us to manage your invoices',
//                       style: TextStyle(color: Colors.grey[600]),
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         _buildStepIndicator(1, step),
//                         SizedBox(width: 20),
//                         _buildStepIndicator(2, step),
//                         SizedBox(width: 20),
//                         _buildStepIndicator(3, step),
//                       ],
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
//                     if (step == 1) ...[
//                       TextField(
//                         controller: _fullNameController,
//                         decoration: InputDecoration(
//                           labelText: 'Full Name',
//                           prefixIcon: Icon(Icons.person),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 16),
//                       TextField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                           labelText: 'Email Address',
//                           prefixIcon: Icon(Icons.email),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 16),
//                       _isLoading
//                           ? CircularProgressIndicator()
//                           : ElevatedButton(
//                             onPressed: () => _submitStep1(context),
//                             child: Text('Send Verification Code'),
//                             style: ElevatedButton.styleFrom(
//                               minimumSize: Size(double.infinity, 50),
//                             ),
//                           ),
//                     ],
//                     if (step == 2) ...[
//                       TextField(
//                         controller: _otpController,
//                         decoration: InputDecoration(
//                           labelText: 'Verification Code',
//                           prefixIcon: Icon(Icons.vpn_key),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                         maxLength: 6,
//                       ),
//                       SizedBox(height: 16),
//                       _isLoading
//                           ? CircularProgressIndicator()
//                           : ElevatedButton(
//                             onPressed: () => _submitStep2(context),
//                             child: Text('Verify Code'),
//                             style: ElevatedButton.styleFrom(
//                               minimumSize: Size(double.infinity, 50),
//                             ),
//                           ),
//                       TextButton(
//                         onPressed: () => _resendOTP(context),
//                         child: Text('Didn\'t receive the code? Send again'),
//                       ),
//                     ],
//                     if (step == 3) ...[
//                       TextField(
//                         controller: _passwordController,
//                         decoration: InputDecoration(
//                           labelText: 'Create Password',
//                           prefixIcon: Icon(Icons.lock),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         obscureText: true,
//                       ),
//                       SizedBox(height: 16),
//                       TextField(
//                         controller: _confirmPasswordController,
//                         decoration: InputDecoration(
//                           labelText: 'Confirm Password',
//                           prefixIcon: Icon(Icons.lock),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         obscureText: true,
//                       ),
//                       SizedBox(height: 16),
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: _agreeTerms,
//                             onChanged:
//                                 (value) => setState(() => _agreeTerms = value!),
//                           ),
//                           Expanded(
//                             child: Text(
//                               'I agree to the Terms of Service and Privacy Policy',
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 16),
//                       _isLoading
//                           ? CircularProgressIndicator()
//                           : ElevatedButton(
//                             onPressed: () => _submitStep3(context),
//                             child: Text('Create Account'),
//                             style: ElevatedButton.styleFrom(
//                               minimumSize: Size(double.infinity, 50),
//                             ),
//                           ),
//                     ],
//                     SizedBox(height: 16),
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: Text('Already have an account? Log in'),
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

//   Widget _buildStepIndicator(int stepNumber, int currentStep) {
//     return CircleAvatar(
//       radius: 20,
//       backgroundColor:
//           currentStep == stepNumber
//               ? Color(0xFF4E54C8)
//               : currentStep > stepNumber
//               ? Colors.green
//               : Colors.grey[300],
//       child: Icon(
//         currentStep > stepNumber ? Icons.check : Icons.circle,
//         color: Colors.white,
//         size: 20,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _agreeTerms = false;
  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  void _submitStep1(BuildContext context) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final result = await authProvider.registerStep1(
      _fullNameController.text,
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

  void _submitStep2(BuildContext context) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final result = await authProvider.verifyOTP(_otpController.text);

    setState(() {
      _isLoading = false;
      if (result['status'] == 'error') {
        _errorMessage = result['message'];
      } else {
        _successMessage = result['message'];
      }
    });
  }

  void _submitStep3(BuildContext context) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final result = await authProvider.completeRegistration(
      _passwordController.text,
      _confirmPasswordController.text,
      _agreeTerms,
    );

    setState(() {
      _isLoading = false;
      if (result['status'] == 'error') {
        _errorMessage = result['message'];
      } else {
        _successMessage = result['message'];
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  void _resendOTP(BuildContext context) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final result = await authProvider.resendOTP();

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
    final authProvider = Provider.of<AuthProvider>(context);

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
                        Icons.person_add,
                        size: 30,
                        color: Color(0xFF5E5CE6),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sign up to get started',
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
                    if (authProvider.regStep == 1) ...[
                      TextField(
                        controller: _fullNameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
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
                            onPressed: () => _submitStep1(context),
                            child: const Text('NEXT'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                            ),
                          ),
                    ] else if (authProvider.regStep == 2) ...[
                      TextField(
                        controller: _otpController,
                        decoration: InputDecoration(
                          labelText: 'Enter OTP',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () => _resendOTP(context),
                        child: const Text('Resend OTP'),
                      ),
                      const SizedBox(height: 16),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                            onPressed: () => _submitStep2(context),
                            child: const Text('VERIFY OTP'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                            ),
                          ),
                    ] else if (authProvider.regStep == 3) ...[
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: _agreeTerms,
                            onChanged:
                                (value) => setState(() => _agreeTerms = value!),
                          ),
                          Expanded(
                            child: Text('I agree to the Terms & Conditions'),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      _isLoading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                            onPressed: () => _submitStep3(context),
                            child: Text('COMPLETE REGISTRATION'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                            ),
                          ),
                    ],
                    SizedBox(height: 16),
                    TextButton(
                      onPressed:
                          () =>
                              Navigator.pushReplacementNamed(context, '/login'),
                      child: Text('Already have an account? Log In'),
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

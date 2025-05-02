// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'dart:convert';

// // // class LandingScreen extends StatefulWidget {
// // //   const LandingScreen({Key? key}) : super(key: key);

// // //   @override
// // //   _LandingScreenState createState() => _LandingScreenState();
// // // }

// // // class _LandingScreenState extends State<LandingScreen> {
// // //   String companyName = 'Loading...';
// // //   bool isLoading = true;
// // //   String errorMessage = '';

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     fetchLandingData();
// // //   }

// // //   Future<void> fetchLandingData() async {
// // //     try {
// // //       final response = await http.get(
// // //         Uri.parse('https://yourserver.com/landing.php'),
// // //       );
// // //       if (response.statusCode == 200) {
// // //         final data = jsonDecode(response.body);
// // //         if (data['status'] == 'success') {
// // //           setState(() {
// // //             companyName = data['data']['company_name'];
// // //             isLoading = false;
// // //           });
// // //         } else {
// // //           setState(() {
// // //             errorMessage = data['message'];
// // //             isLoading = false;
// // //           });
// // //         }
// // //       } else if (response.statusCode == 401) {
// // //         final data = jsonDecode(response.body);
// // //         Navigator.pushReplacementNamed(context, '/login');
// // //         setState(() {
// // //           errorMessage = data['message'];
// // //           isLoading = false;
// // //         });
// // //       } else {
// // //         throw Exception('Failed to load data');
// // //       }
// // //     } catch (e) {
// // //       setState(() {
// // //         errorMessage = 'Error connecting to server: $e';
// // //         isLoading = false;
// // //       });
// // //     }
// // //   }

// // //   void logout() {
// // //     // Implement logout logic (e.g., clear session, navigate to login)
// // //     Navigator.pushReplacementNamed(context, '/login');
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Row(
// // //           children: [
// // //             Image.asset('assets/images/logo.png', height: 40),
// // //             const SizedBox(width: 10),
// // //             const Text('Business Management System'),
// // //           ],
// // //         ),
// // //         backgroundColor: const Color(0xFF4F46E5),
// // //         actions: [
// // //           PopupMenuButton<String>(
// // //             onSelected: (value) {
// // //               if (value == 'profile') {
// // //                 Navigator.pushNamed(context, '/profile');
// // //               } else if (value == 'settings') {
// // //                 Navigator.pushNamed(context, '/settings');
// // //               } else if (value == 'logout') {
// // //                 logout();
// // //               }
// // //             },
// // //             itemBuilder:
// // //                 (context) => [
// // //                   const PopupMenuItem(
// // //                     value: 'profile',
// // //                     child: Row(
// // //                       children: [
// // //                         Icon(Icons.person),
// // //                         SizedBox(width: 8),
// // //                         Text('Profile'),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                   const PopupMenuItem(
// // //                     value: 'settings',
// // //                     child: Row(
// // //                       children: [
// // //                         Icon(Icons.settings),
// // //                         SizedBox(width: 8),
// // //                         Text('Settings'),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                   const PopupMenuDivider(),
// // //                   const PopupMenuItem(
// // //                     value: 'logout',
// // //                     child: Row(
// // //                       children: [
// // //                         Icon(Icons.logout),
// // //                         SizedBox(width: 8),
// // //                         Text('Logout'),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ],
// // //             child: Padding(
// // //               padding: const EdgeInsets.symmetric(horizontal: 16),
// // //               child: Row(
// // //                 children: [
// // //                   const Icon(Icons.account_circle),
// // //                   const SizedBox(width: 8),
// // //                   Text(companyName),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //       body:
// // //           isLoading
// // //               ? const Center(child: CircularProgressIndicator())
// // //               : errorMessage.isNotEmpty
// // //               ? Center(
// // //                 child: Text(
// // //                   errorMessage,
// // //                   style: const TextStyle(color: Colors.red),
// // //                 ),
// // //               )
// // //               : Padding(
// // //                 padding: const EdgeInsets.all(16),
// // //                 child: Column(
// // //                   children: [
// // //                     const Text(
// // //                       'Welcome to Your Dashboard',
// // //                       style: TextStyle(
// // //                         fontSize: 32,
// // //                         fontWeight: FontWeight.bold,
// // //                       ),
// // //                       textAlign: TextAlign.center,
// // //                     ),
// // //                     const SizedBox(height: 8),
// // //                     const Text(
// // //                       'Choose a management system to get started',
// // //                       style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
// // //                       textAlign: TextAlign.center,
// // //                     ),
// // //                     const SizedBox(height: 24),
// // //                     Expanded(
// // //                       child: GridView.count(
// // //                         crossAxisCount: 2,
// // //                         crossAxisSpacing: 16,
// // //                         mainAxisSpacing: 16,
// // //                         childAspectRatio: 0.8,
// // //                         children: [
// // //                           ManagementCard(
// // //                             icon: Icons.description,
// // //                             title: 'Invoice Management',
// // //                             description:
// // //                                 'Create and manage invoices, track payments, and generate reports for your business.',
// // //                             onTap:
// // //                                 () => Navigator.pushNamed(context, '/invoices'),
// // //                           ),
// // //                           ManagementCard(
// // //                             icon: Icons.file_copy,
// // //                             title: 'Quotation Management',
// // //                             description:
// // //                                 'Create professional quotations, manage proposals, and convert them to invoices.',
// // //                             onTap:
// // //                                 () =>
// // //                                     Navigator.pushNamed(context, '/quotations'),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //     );
// // //   }
// // // }

// // // class ManagementCard extends StatelessWidget {
// // //   final IconData icon;
// // //   final String title;
// // //   final String description;
// // //   final VoidCallback onTap;

// // //   const ManagementCard({
// // //     Key? key,
// // //     required this.icon,
// // //     required this.title,
// // //     required this.description,
// // //     required this.onTap,
// // //   }) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return GestureDetector(
// // //       onTap: onTap,
// // //       child: AnimatedContainer(
// // //         duration: const Duration(milliseconds: 200),
// // //         decoration: BoxDecoration(
// // //           color: Colors.white,
// // //           borderRadius: BorderRadius.circular(15),
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: Colors.black.withOpacity(0.1),
// // //               blurRadius: 6,
// // //               offset: const Offset(0, 4),
// // //             ),
// // //           ],
// // //         ),
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(16),
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               Icon(icon, size: 64, color: const Color(0xFF4F46E5)),
// // //               const SizedBox(height: 16),
// // //               Text(
// // //                 title,
// // //                 style: const TextStyle(
// // //                   fontSize: 20,
// // //                   fontWeight: FontWeight.w600,
// // //                 ),
// // //                 textAlign: TextAlign.center,
// // //               ),
// // //               const SizedBox(height: 8),
// // //               Text(
// // //                 description,
// // //                 style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
// // //                 textAlign: TextAlign.center,
// // //               ),
// // //               const SizedBox(height: 16),
// // //               ElevatedButton(
// // //                 onPressed: onTap,
// // //                 child: Row(
// // //                   mainAxisSize: MainAxisSize.min,
// // //                   children: const [
// // //                     Text('Explore'),
// // //                     SizedBox(width: 8),
// // //                     Icon(Icons.arrow_forward, size: 16),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import '../../auth_provider.dart';

// // class LandingScreen extends StatefulWidget {
// //   const LandingScreen({Key? key}) : super(key: key);

// //   @override
// //   _LandingScreenState createState() => _LandingScreenState();
// // }

// // class _LandingScreenState extends State<LandingScreen> {
// //   String companyName = 'Loading...';
// //   List<Map<String, dynamic>> emailTemplates = [];
// //   bool isLoading = true;
// //   String errorMessage = '';

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchLandingData();
// //   }

// //   Future<void> fetchLandingData() async {
// //     final authProvider = Provider.of<AuthProvider>(context, listen: false);
// //     setState(() {
// //       isLoading = true;
// //       errorMessage = '';
// //       companyName = authProvider.fullName ?? 'Loading...';
// //     });

// //     final data = await authProvider.fetchLandingData();
// //     setState(() {
// //       isLoading = false;
// //       if (data['status'] == 'success') {
// //         companyName = data['data']['company_name'];
// //         emailTemplates = List<Map<String, dynamic>>.from(
// //           data['data']['email_templates'] ?? [],
// //         );
// //       } else {
// //         errorMessage = data['message'];
// //         if (data['redirect'] == 'login.php') {
// //           authProvider.logout();
// //           Navigator.pushReplacementNamed(context, '/login');
// //         }
// //       }
// //     });
// //   }

// //   void logout() {
// //     final authProvider = Provider.of<AuthProvider>(context, listen: false);
// //     authProvider.logout();
// //     Navigator.pushReplacementNamed(context, '/login');
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Row(
// //           children: [
// //             Image.asset(
// //               'assets/images/logo.png',
// //               height: 40,
// //               errorBuilder: (_, __, ___) => Icon(Icons.business),
// //             ),
// //             const SizedBox(width: 10),
// //             const Text('Business Management System'),
// //           ],
// //         ),
// //         backgroundColor: const Color(0xFF4F46E5),
// //         actions: [
// //           PopupMenuButton<String>(
// //             onSelected: (value) {
// //               if (value == 'profile') {
// //                 Navigator.pushNamed(context, '/profile');
// //               } else if (value == 'settings') {
// //                 Navigator.pushNamed(context, '/settings');
// //               } else if (value == 'logout') {
// //                 logout();
// //               }
// //             },
// //             itemBuilder:
// //                 (context) => [
// //                   const PopupMenuItem(
// //                     value: 'profile',
// //                     child: Row(
// //                       children: [
// //                         Icon(Icons.person),
// //                         SizedBox(width: 8),
// //                         Text('Profile'),
// //                       ],
// //                     ),
// //                   ),
// //                   const PopupMenuItem(
// //                     value: 'settings',
// //                     child: Row(
// //                       children: [
// //                         Icon(Icons.settings),
// //                         SizedBox(width: 8),
// //                         Text('Settings'),
// //                       ],
// //                     ),
// //                   ),
// //                   const PopupMenuDivider(),
// //                   const PopupMenuItem(
// //                     value: 'logout',
// //                     child: Row(
// //                       children: [
// //                         Icon(Icons.logout),
// //                         SizedBox(width: 8),
// //                         Text('Logout'),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16),
// //               child: Row(
// //                 children: [
// //                   const Icon(Icons.account_circle),
// //                   const SizedBox(width: 8),
// //                   Text(companyName),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //       body:
// //           isLoading
// //               ? const Center(child: CircularProgressIndicator())
// //               : errorMessage.isNotEmpty
// //               ? Center(
// //                 child: Text(
// //                   errorMessage,
// //                   style: const TextStyle(color: Colors.red),
// //                 ),
// //               )
// //               : Padding(
// //                 padding: const EdgeInsets.all(16),
// //                 child: Column(
// //                   children: [
// //                     Text(
// //                       'Welcome to $companyName',
// //                       style: const TextStyle(
// //                         fontSize: 32,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                     const SizedBox(height: 8),
// //                     const Text(
// //                       'Choose a management system or view email templates',
// //                       style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                     const SizedBox(height: 24),
// //                     if (emailTemplates.isNotEmpty) ...[
// //                       const Text(
// //                         'Email Templates',
// //                         style: TextStyle(
// //                           fontSize: 20,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 8),
// //                       Expanded(
// //                         child: ListView.builder(
// //                           itemCount: emailTemplates.length,
// //                           itemBuilder: (context, index) {
// //                             final template = emailTemplates[index];
// //                             return ListTile(
// //                               title: Text('Template ${template['id']}'),
// //                               subtitle: Text(template['template']),
// //                               onTap: () {
// //                                 // TODO: Implement template preview or edit
// //                                 ScaffoldMessenger.of(context).showSnackBar(
// //                                   SnackBar(
// //                                     content: Text(
// //                                       'Selected template ${template['id']}',
// //                                     ),
// //                                   ),
// //                                 );
// //                               },
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                     ],
// //                     const SizedBox(height: 24),
// //                     Expanded(
// //                       child: GridView.count(
// //                         crossAxisCount: 2,
// //                         crossAxisSpacing: 16,
// //                         mainAxisSpacing: 16,
// //                         childAspectRatio: 0.8,
// //                         children: [
// //                           ManagementCard(
// //                             icon: Icons.description,
// //                             title: 'Invoice Management',
// //                             description:
// //                                 'Create and manage invoices, track payments, and generate reports for your business.',
// //                             onTap:
// //                                 () => Navigator.pushNamed(context, '/invoices'),
// //                           ),
// //                           ManagementCard(
// //                             icon: Icons.file_copy,
// //                             title: 'Quotation Management',
// //                             description:
// //                                 'Create professional quotations, manage proposals, and convert them to invoices.',
// //                             onTap:
// //                                 () =>
// //                                     Navigator.pushNamed(context, '/quotations'),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //     );
// //   }
// // }

// // class ManagementCard extends StatelessWidget {
// //   final IconData icon;
// //   final String title;
// //   final String description;
// //   final VoidCallback onTap;

// //   const ManagementCard({
// //     Key? key,
// //     required this.icon,
// //     required this.title,
// //     required this.description,
// //     required this.onTap,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: AnimatedContainer(
// //         duration: const Duration(milliseconds: 200),
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(15),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black.withOpacity(0.1),
// //               blurRadius: 6,
// //               offset: const Offset(0, 4),
// //             ),
// //           ],
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.all(16),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Icon(icon, size: 64, color: const Color(0xFF4F46E5)),
// //               const SizedBox(height: 16),
// //               Text(
// //                 title,
// //                 style: const TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.w600,
// //                 ),
// //                 textAlign: TextAlign.center,
// //               ),
// //               const SizedBox(height: 8),
// //               Text(
// //                 description,
// //                 style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
// //                 textAlign: TextAlign.center,
// //               ),
// //               const SizedBox(height: 16),
// //               ElevatedButton(
// //                 onPressed: onTap,
// //                 child: Row(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: const [
// //                     Text('Explore'),
// //                     SizedBox(width: 8),
// //                     Icon(Icons.arrow_forward, size: 16),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../auth_provider.dart';

// class LandingScreen extends StatefulWidget {
//   const LandingScreen({Key? key}) : super(key: key);

//   @override
//   _LandingScreenState createState() => _LandingScreenState();
// }

// class _LandingScreenState extends State<LandingScreen> {
//   String companyName = 'Loading...';
//   List<Map<String, dynamic>> emailTemplates = [];
//   bool isLoading = true;
//   String errorMessage = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchLandingData();
//   }

//   Future<void> fetchLandingData() async {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     setState(() {
//       isLoading = true;
//       errorMessage = '';
//       companyName = authProvider.fullName ?? 'Loading...';
//     });

//     final data = await authProvider.fetchLandingData();
//     setState(() {
//       isLoading = false;
//       if (data['status'] == 'success') {
//         companyName = data['data']['company_name'];
//         emailTemplates = List<Map<String, dynamic>>.from(
//           data['data']['email_templates'] ?? [],
//         );
//       } else {
//         errorMessage = data['message'];
//         if (data['redirect'] == 'login.php') {
//           authProvider.logout();
//           Navigator.pushReplacementNamed(context, '/login');
//         }
//       }
//     });
//   }

//   void logout() {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     authProvider.logout();
//     Navigator.pushReplacementNamed(context, '/login');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Image.asset(
//               'assets/images/logo.png',
//               height: 40,
//               errorBuilder: (_, __, ___) => const Icon(Icons.business),
//             ),
//             const SizedBox(width: 10),
//             const Text('Business Management System'),
//           ],
//         ),
//         backgroundColor: const Color(0xFF4F46E5),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: (value) {
//               if (value == 'profile') {
//                 Navigator.pushNamed(context, '/profile');
//               } else if (value == 'settings') {
//                 Navigator.pushNamed(context, '/settings');
//               } else if (value == 'logout') {
//                 logout();
//               }
//             },
//             itemBuilder:
//                 (context) => [
//                   const PopupMenuItem(
//                     value: 'profile',
//                     child: Row(
//                       children: [
//                         Icon(Icons.person),
//                         SizedBox(width: 8),
//                         Text('Profile'),
//                       ],
//                     ),
//                   ),
//                   const PopupMenuItem(
//                     value: 'settings',
//                     child: Row(
//                       children: [
//                         Icon(Icons.settings),
//                         SizedBox(width: 8),
//                         Text('Settings'),
//                       ],
//                     ),
//                   ),
//                   const PopupMenuDivider(),
//                   const PopupMenuItem(
//                     value: 'logout',
//                     child: Row(
//                       children: [
//                         Icon(Icons.logout),
//                         SizedBox(width: 8),
//                         Text('Logout'),
//                       ],
//                     ),
//                   ),
//                 ],
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 children: [
//                   const Icon(Icons.account_circle),
//                   const SizedBox(width: 8),
//                   Text(companyName),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body:
//           isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : errorMessage.isNotEmpty
//               ? Center(
//                 child: Text(
//                   errorMessage,
//                   style: const TextStyle(color: Colors.red),
//                 ),
//               )
//               : Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Welcome to $companyName',
//                       style: const TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       'Choose a management system or view email templates',
//                       style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 24),
//                     if (emailTemplates.isNotEmpty) ...[
//                       const Text(
//                         'Email Templates',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: emailTemplates.length,
//                           itemBuilder: (context, index) {
//                             final template = emailTemplates[index];
//                             return ListTile(
//                               title: Text('Template ${template['id']}'),
//                               subtitle: Text(template['template']),
//                               onTap: () {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text(
//                                       'Selected template ${template['id']}',
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                     const SizedBox(height: 24),
//                     Expanded(
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 16,
//                         mainAxisSpacing: 16,
//                         childAspectRatio: 0.8,
//                         children: [
//                           ManagementCard(
//                             icon: Icons.description,
//                             title: 'Invoice Management',
//                             description:
//                                 'Create and manage invoices, track payments, and generate reports for your business.',
//                             onTap:
//                                 () => Navigator.pushNamed(context, '/invoices'),
//                           ),
//                           ManagementCard(
//                             icon: Icons.file_copy,
//                             title: 'Quotation Management',
//                             description:
//                                 'Create professional quotations, manage proposals, and convert them to invoices.',
//                             onTap:
//                                 () =>
//                                     Navigator.pushNamed(context, '/quotations'),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//     );
//   }
// }

// class ManagementCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String description;
//   final VoidCallback onTap;

//   const ManagementCard({
//     Key? key,
//     required this.icon,
//     required this.title,
//     required this.description,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 6,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 48, color: const Color(0xFF5E5CE6)),
//             const SizedBox(height: 8),
//             Text(
//               title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth_provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String companyName = 'Loading...';
  List<Map<String, dynamic>> emailTemplates = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    print('LandingScreen: Initializing, fetching landing data');
    fetchLandingData();
  }

  Future<void> fetchLandingData() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    setState(() {
      isLoading = true;
      errorMessage = '';
      companyName = authProvider.fullName ?? 'Loading...';
    });

    final data = await authProvider.fetchLandingData();
    setState(() {
      isLoading = false;
      if (data['status'] == 'success') {
        companyName = data['data']['company_name'];
        emailTemplates = List<Map<String, dynamic>>.from(
          data['data']['email_templates'] ?? [],
        );
        print(
          'LandingScreen: Data loaded successfully, companyName=$companyName',
        );
      } else {
        errorMessage = data['message'];
        print('LandingScreen: Error - $errorMessage');
        if (data['redirect'] == 'login.php') {
          print(
            'LandingScreen: Redirecting to login due to unauthorized access',
          );
          authProvider.logout();
          Navigator.pushReplacementNamed(context, '/login');
        }
      }
    });
  }

  void logout() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.logout();
    Navigator.pushReplacementNamed(context, '/login');
    print('LandingScreen: Logged out, navigating to /login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 30,
              errorBuilder:
                  (_, __, ___) => const Icon(Icons.business, size: 30),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'Business Management',
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF4F46E5),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'profile') {
                Navigator.pushNamed(context, '/profile');
              } else if (value == 'settings') {
                Navigator.pushNamed(context, '/settings');
              } else if (value == 'logout') {
                logout();
              }
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: 'profile',
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 8),
                        Text('Profile'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'settings',
                    child: Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(width: 8),
                        Text('Settings'),
                      ],
                    ),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(width: 8),
                        Text('Logout'),
                      ],
                    ),
                  ),
                ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.account_circle, size: 20),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      companyName,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : errorMessage.isNotEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: fetchLandingData,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              )
              : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Welcome to $companyName',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Choose a management system or view email templates',
                      style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    if (emailTemplates.isNotEmpty) ...[
                      const Text(
                        'Email Templates',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListView.builder(
                          itemCount: emailTemplates.length,
                          itemBuilder: (context, index) {
                            final template = emailTemplates[index];
                            return ListTile(
                              title: Text('Template ${template['id']}'),
                              subtitle: Text(template['template']),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Selected template ${template['id']}',
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.8,
                        children: [
                          ManagementCard(
                            icon: Icons.description,
                            title: 'Invoice Management',
                            description:
                                'Create and manage invoices, track payments, and generate reports for your business.',
                            onTap:
                                () => Navigator.pushNamed(context, '/invoices'),
                          ),
                          ManagementCard(
                            icon: Icons.file_copy,
                            title: 'Quotation Management',
                            description:
                                'Create professional quotations, manage proposals, and convert them to invoices.',
                            onTap:
                                () =>
                                    Navigator.pushNamed(context, '/quotations'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}

class ManagementCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const ManagementCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: const Color(0xFF5E5CE6)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

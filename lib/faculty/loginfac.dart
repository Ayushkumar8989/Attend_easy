// import 'package:attend_easy/faculty/bottom_nav.dart';
// import 'package:attend_easy/faculty/signinfac.dart';
// import 'package:flutter/material.dart';

// class LoginFac extends StatefulWidget {
//   const LoginFac({super.key});

//   @override
//   State<LoginFac> createState() => _LoginState();
// }

// class _LoginState extends State<LoginFac> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, Constraints) {
//         bool isDesktop = Constraints.maxWidth > 600;
//         double screenWidth = Constraints.maxWidth;
//         double screenHeight = Constraints.maxHeight;
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text(
//               'Welcome back to AttendEasy!',
//               style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                   fontFamily: 'DM Sans',
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           body: SingleChildScrollView(
//             child: Center(
//               child: Container(
//                 width: screenWidth * 1.0,
//                 height: screenHeight * (isDesktop ? 1.0 : 1.0),
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     // Container(
//                     //   //width: screenWidth * 0.7,
//                     //   width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     //   height: 50,
//                     //   margin: const EdgeInsets.only(top: 70),
//                     //   child: const Text(
//                     //     'Welcome back to AttendEasy!',
//                     //     style: TextStyle(
//                     //         fontSize: 20,
//                     //         color: Colors.black,
//                     //         fontFamily: 'DM Sans',
//                     //         fontWeight: FontWeight.bold),
//                     //   ),
//                     // ),
//                     Container(
//                       width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                       height: 50,
//                       margin: const EdgeInsets.only(top: 10),
//                       child: const Text(
//                         'Log in to manage classes and track attendance seamlessly.',
//                         style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.black,
//                             fontFamily: 'DM Sans',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(
//                       width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                       height: 50,
//                       child: const Text(
//                         'Staff ID',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.black,
//                             fontFamily: 'DM Sans',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(
//                       width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                       height: 50,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: ' Enter your number',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                       height: 50,
//                       child: const Text(
//                         'Password',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.black,
//                             fontFamily: 'DM Sans',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(
//                       width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                       height: 50,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: ' Enter your password',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                       height: 50,
//                       child: Row(
//                         children: [
//                           Container(
//                             child: const Text('Forgot Password?'),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.only(right: 15),
//                             child: TextButton(
//                               onPressed: () {},
//                               child: const Text(
//                                 'Reset it',
//                                 style: TextStyle(
//                                   color: Color(0xFF1C5B41),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const Bottom_Nav(),
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF1DC99E),
//                           foregroundColor: Colors.white,
//                         ),
//                         child: const Text(
//                           'Login',
//                           style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                       height: 50,
//                       child: Row(
//                         children: [
//                           Container(
//                             child: const Text('Dont have an account'),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.only(right: 15),
//                             child: TextButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => const SignInFac(),
//                                   ),
//                                 );
//                               },
//                               child: const Text(
//                                 'Sign Up',
//                                 style: TextStyle(
//                                   color: Color(0xFF1DC99E),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:attend_easy/faculty/bottom_nav.dart';
import 'package:attend_easy/faculty/signinfac.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginFac extends StatefulWidget {
  const LoginFac({super.key});

  @override
  State<LoginFac> createState() => _LoginState();
}

class _LoginState extends State<LoginFac> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String staffID = '';
  String password = '';
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        bool isDesktop = Constraints.maxWidth > 600;
        double screenWidth = Constraints.maxWidth;
        double screenHeight = Constraints.maxHeight;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Welcome back to AttendEasy!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: screenWidth * 1.0,
                height: screenHeight * (isDesktop ? 1.0 : 1.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'Log in to manage classes and track attendance seamlessly.',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: const Text(
                        'Staff ID',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: TextField(
                        onChanged: (value) {
                          staffID = value; // Capture staff ID input
                        },
                        decoration: InputDecoration(
                          hintText: ' Enter your number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: const Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: TextField(
                        onChanged: (value) {
                          password = value; // Capture password input
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: ' Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            // Attempt sign-in with Firebase
                            UserCredential userCredential =
                                await _auth.signInWithEmailAndPassword(
                              email: staffID, // Assuming staff ID is the email
                              password: password,
                            );
                            // Navigate to the Bottom Navigation on success
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Bottom_Nav(),
                              ),
                            );
                          } catch (e) {
                            // Show error message if login fails
                            setState(() {
                              errorMessage = e.toString();
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1DC99E),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                        ),
                      ),
                    ),
                    if (errorMessage.isNotEmpty) // Display error message
                      Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: Row(
                        children: [
                          const Text('Dont have an account'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInFac(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xFF1DC99E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

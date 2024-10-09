// import 'package:attend_easy/student/signinstu.dart';
// import 'package:attend_easy/student/stud_homepage.dart';
// import 'package:flutter/material.dart';

// class LoginStu extends StatefulWidget {
//   const LoginStu({super.key});

//   @override
//   State<LoginStu> createState() => _LoginState();
// }

// class _LoginState extends State<LoginStu> {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: screenWidth * 0.9,
//           height: screenHeight * 0.8,
//           color: const Color.fromARGB(255, 249, 249, 249),
//           margin: const EdgeInsets.only(top: 70),
//           child: Column(
//             children: [
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: const Text(
//                   'Welcome back to AttendEasy!',
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontFamily: 'DM Sans',
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: const Text(
//                   'Log in to manage classes and track attendance seamlessly.',
//                   style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.black,
//                       fontFamily: 'DM Sans',
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: const Text(
//                   'Student ID',
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontFamily: 'DM Sans',
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: ' Enter your id number',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: const Text(
//                   'Password',
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontFamily: 'DM Sans',
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: ' Enter your password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: screenWidth * 0.7,
//                 margin: const EdgeInsets.only(left: 38),
//                 child: Row(
//                   children: [
//                     Container(
//                       child: const Text('Forgot Password?'),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(right: 15),
//                       child: TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           'Reset it',
//                           style: TextStyle(
//                             color: Color(0xFF1C5B41),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: screenWidth * 0.7,
//                 margin: const EdgeInsets.only(left: 45),
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AttendEasyScreen(),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF1DC99E),
//                     foregroundColor: Colors.white,
//                   ),
//                   child: const Text(
//                     'Login',
//                     style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 45),
//                 width: screenWidth * 0.7,
//                 child: Row(
//                   children: [
//                     Container(
//                       child: const Text('Dont have an account'),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(right: 15),
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SignInStu(),
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           'Sign Up',
//                           style: TextStyle(
//                             color: Color(0xFF1DC99E),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:attend_easy/student/forgotpass.dart';
import 'package:attend_easy/student/signinstu.dart';
import 'package:attend_easy/student/stud_homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginStu extends StatefulWidget {
  const LoginStu({super.key});

  @override
  State<LoginStu> createState() => _LoginState();
}

class _LoginState extends State<LoginStu> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController stuidController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    stuidController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await _auth.signInWithEmailAndPassword(
        email: stuidController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AttendEasyScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: ${e.toString()}")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.8,
          color: const Color.fromARGB(255, 249, 249, 249),
          margin: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Welcome back to AttendEasy!',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Log in to manage classes and track attendance seamlessly.',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Student ID',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: TextField(
                  controller: stuidController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                margin: const EdgeInsets.only(left: 38),
                child: Row(
                  children: [
                    const Text('Forgot Password?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Forgot(),
                          ),
                        );
                      },
                      child: const Text(
                        'Reset it',
                        style: TextStyle(
                          color: Color(0xFF1C5B41),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                margin: const EdgeInsets.only(left: 45),
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1DC99E),
                    foregroundColor: Colors.white,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                        ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 45),
                width: screenWidth * 0.7,
                child: Row(
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInStu(),
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
    );
  }
}

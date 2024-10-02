import 'package:attend_easy/student/signinstu.dart';
import 'package:flutter/material.dart';

class LoginStu extends StatefulWidget {
  const LoginStu({super.key});

  @override
  State<LoginStu> createState() => _LoginState();
}

class _LoginState extends State<LoginStu> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        bool isDesktop = Constraints.maxWidth > 600;
        double screenWidth = Constraints.maxWidth;
        double screenHeight = Constraints.maxHeight;
        return Scaffold(
          // appBar: AppBar(
          //   title: Text('Welcome back to AttendEasy!'),
          // ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: screenWidth * 1.0,
                height: screenHeight * (isDesktop ? 1.0 : 1.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      //width: screenWidth * 0.7,
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      margin: const EdgeInsets.only(top: 70),
                      child: const Text(
                        'Welcome back to AttendEasy!',
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
                        'Stud ID',
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
                      child: Row(
                        children: [
                          Container(
                            child: const Text('Forgot Password?'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Reset it',
                                style: TextStyle(
                                  color: Color(0xFF1C5B41),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
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
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            child: const Text('Dont have an account'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: TextButton(
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

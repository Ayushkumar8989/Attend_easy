import 'package:attend_easy/faculty/dasb.dart';
import 'package:attend_easy/faculty/signinfac.dart';
import 'package:flutter/material.dart';

class LoginFac extends StatefulWidget {
  const LoginFac({super.key});

  @override
  State<LoginFac> createState() => _LoginFacState();
}

class _LoginFacState extends State<LoginFac> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 600;
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          return SingleChildScrollView(
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * (isDesktop ? 0.9 : 0.8),
              color: Color.fromARGB(255, 249, 249, 249),
              margin: EdgeInsets.only(top: isDesktop ? 50 : 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * (isDesktop ? 0.5 : 0.7),
                    height: 50,
                    margin: EdgeInsets.only(left: isDesktop ? 60 : 45),
                    child: Text(
                      'Welcome back to AttendEasy!',
                      style: TextStyle(
                        fontSize: isDesktop ? 24 : 20,
                        color: Colors.black,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * (isDesktop ? 0.5 : 0.7),
                    height: 50,
                    margin: EdgeInsets.only(left: isDesktop ? 60 : 45),
                    child: Text(
                      'Log in to manage classes and track attendance seamlessly.',
                      style: TextStyle(
                        fontSize: isDesktop ? 16 : 12,
                        color: Colors.black,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildTextFieldSection(
                      'Staff ID', 'Enter your number', isDesktop, screenWidth),
                  _buildTextFieldSection('Password', 'Enter your password',
                      isDesktop, screenWidth),
                  Container(
                    width: screenWidth * (isDesktop ? 0.5 : 0.7),
                    margin: EdgeInsets.only(left: isDesktop ? 55 : 38),
                    child: Row(
                      children: [
                        Text('Forgot Password?'),
                        TextButton(
                          onPressed: () {},
                          child: Text(
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
                    width: screenWidth * (isDesktop ? 0.5 : 0.7),
                    margin: EdgeInsets.only(left: isDesktop ? 60 : 45),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dasb(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: isDesktop ? 22 : 20,
                          fontFamily: 'Inter',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1DC99E),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * (isDesktop ? 0.5 : 0.7),
                    margin: EdgeInsets.only(left: isDesktop ? 60 : 45, top: 10),
                    child: Row(
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInFac(),
                              ),
                            );
                          },
                          child: Text(
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
          );
        },
      ),
    );
  }

  // Helper method to reduce code repetition for TextFields
  Widget _buildTextFieldSection(
      String label, String hintText, bool isDesktop, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenWidth * (isDesktop ? 0.5 : 0.7),
          margin: EdgeInsets.only(left: isDesktop ? 60 : 45, top: 10),
          child: Text(
            label,
            style: TextStyle(
              fontSize: isDesktop ? 22 : 20,
              color: Colors.black,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: screenWidth * (isDesktop ? 0.5 : 0.7),
          height: 50,
          margin: EdgeInsets.only(left: isDesktop ? 60 : 45, top: 5),
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

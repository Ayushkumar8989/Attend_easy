import 'package:attend_easy/faculty/home.dart';
import 'package:attend_easy/faculty/signinfac.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginFac extends StatefulWidget {
  const LoginFac({super.key});

  @override
  State<LoginFac> createState() => _LoginState();
}

class _LoginState extends State<LoginFac> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (conntext, Constraints) {
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
                      width: screenWidth * 0.7,
                      height: 50,
                      margin: EdgeInsets.only(top: 70),
                      child: Text(
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
                      //margin: EdgeInsets.only(left: 45),
                      child: Text(
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
                      //margin: EdgeInsets.only(left: 45),
                      child: Text(
                        'Staff ID',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: screenWidth * (isDesktop ? 0.6 : 0.7),
                      height: 50,
                      //margin: EdgeInsets.only(left: 45),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ' Enter your number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.7,
                      height: 50,
                      // margin: EdgeInsets.only(left: 45),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: screenWidth * (isDesktop ? 0.6 : 0.7),
                      height: 50,
                      //margin: EdgeInsets.only(left: 45),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ' Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * (isDesktop ? 0.7 : 0.6),
                      //margin: EdgeInsets.only(left: 45),
                      child: Row(
                        children: [
                          Container(
                            child: Text('Forgot Password?'),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
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
                    Container(
                      width: screenWidth * (isDesktop ? 0.6 : 0.7),
                      height: 50,
                      //margin: EdgeInsets.only(left: 45),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1DC99E),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 45),
                      width: screenWidth * 0.7,
                      child: Row(
                        children: [
                          Container(
                            child: Text('Dont have an account'),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: TextButton(
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

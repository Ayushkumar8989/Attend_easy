import 'package:attendance/student/signinstu.dart';
import 'package:flutter/material.dart';

class LoginStu extends StatefulWidget {
  const LoginStu({super.key});

  @override
  State<LoginStu> createState() => _LoginState();
}

class _LoginState extends State<LoginStu> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.8,
          color: Color.fromARGB(255, 249, 249, 249),
          margin: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: EdgeInsets.only(left: 45),
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
                margin: EdgeInsets.only(left: 45),
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
                margin: EdgeInsets.only(left: 45),
                child: Text(
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
                margin: EdgeInsets.only(left: 45),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Enter your id number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: EdgeInsets.only(left: 45),
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
                width: screenWidth * 0.7,
                height: 50,
                margin: EdgeInsets.only(left: 45),
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
                width: screenWidth * 0.7,
                margin: EdgeInsets.only(left: 38),
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
                width: screenWidth * 0.7,
                margin: EdgeInsets.only(left: 45),
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
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
                              builder: (context) => SignInStu(),
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
    );
  }
}

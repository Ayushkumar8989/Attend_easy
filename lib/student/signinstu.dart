import 'package:attend_easy/student/loginstu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInStu extends StatefulWidget {
  const SignInStu({super.key});

  @override
  State<SignInStu> createState() => _SignInState();
}

class _SignInState extends State<SignInStu> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth * 1.0,
          height: screenHeight * 1.0,
          color: const Color.fromARGB(255, 249, 249, 249),
          margin: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.85,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Join AttendEasy Today!',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.85,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Create your account to manage classes and track attendance effortlessly.',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.85,
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
                width: screenWidth * 0.85,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
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
                width: screenWidth * 0.85,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Phone No.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.85,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Enter your phone number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.85,
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
                width: screenWidth * 0.85,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Choose password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.85,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Confirm Password',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.85,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Confirm password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.85,
                margin: const EdgeInsets.only(left: 38),
                child: Row(
                  children: [
                    Container(
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(
                            () {
                              isChecked = newValue!;
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      child: const Text(
                        'You have agreed with our',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Term & Condition',
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
                width: screenWidth * 0.85,
                margin: const EdgeInsets.only(left: 45),
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginStu()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1DC99E),
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 45),
                width: screenWidth * 0.85,
                child: Row(
                  children: [
                    Container(
                      child: const Text('Already have an account?'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginStu()),
                          );
                        },
                        child: const Text(
                          'Log In',
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

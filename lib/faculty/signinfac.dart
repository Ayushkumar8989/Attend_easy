import 'package:attend_easy/faculty/loginfac.dart';
import 'package:attend_easy/faculty/verification.dart';
import 'package:flutter/material.dart';

class SignInFac extends StatefulWidget {
  const SignInFac({super.key});

  @override
  State<SignInFac> createState() => _SignInState();
}

class _SignInState extends State<SignInFac> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Container(
            width: screenWidth * 0.9,
            height: screenHeight * 1.0,
            color: Color.fromARGB(255, 249, 249, 249),
            margin: EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Container(
                  width: screenWidth * 0.85,
                  height: 50,
                  margin: EdgeInsets.only(left: 45),
                  child: Text(
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
                  margin: EdgeInsets.only(left: 45),
                  child: Text(
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
                  margin: EdgeInsets.only(left: 45),
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
                  width: screenWidth * 0.85,
                  height: 50,
                  margin: EdgeInsets.only(left: 45),
                  child: TextFormField(
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
                  margin: EdgeInsets.only(left: 45),
                  child: Text(
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
                  margin: EdgeInsets.only(left: 45),
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
                  width: screenWidth * 0.85,
                  height: 50,
                  margin: EdgeInsets.only(left: 45),
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
                  margin: EdgeInsets.only(left: 45),
                  child: Text(
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
                  margin: EdgeInsets.only(left: 45),
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
                  margin: EdgeInsets.only(left: 38),
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
                        child: Text(
                          'You have agreed with our',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
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
                  margin: EdgeInsets.only(left: 45),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Verification()),
                      );
                    },
                    child: Text(
                      'Sign Up',
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
                  width: screenWidth * 0.85,
                  child: Row(
                    children: [
                      Container(
                        child: Text('Already have an account?'),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginFac()),
                            );
                          },
                          child: Text(
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
      ),
    );
  }
}

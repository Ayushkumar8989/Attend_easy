import 'package:attend_easy/student/loginstu.dart';
import 'package:flutter/material.dart';

class SignInStu extends StatefulWidget {
  const SignInStu({super.key});

  @override
  State<SignInStu> createState() => _SignInState();
}

class _SignInState extends State<SignInStu> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      bool isDesktop = Constraints.maxWidth > 600;
      double screenWidth = Constraints.maxWidth;
      double screenHeight = Constraints.maxHeight;

      return Center(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Join AttendEasy Today!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Form(
              child: Container(
                width: screenWidth * 1.0,
                height: screenHeight * 1.0,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                        //margin: EdgeInsets.only(top: 70),
                        // width: screenWidth * (isDesktop ? 0.6 : 0.85),
                        // height: 50,
                        // margin: EdgeInsets.only(top: 70),
                        // child: Text(
                        //   'Join AttendEasy Today!',
                        //   style: TextStyle(
                        //       fontSize: 20,
                        //       color: Colors.black,
                        //       fontFamily: 'DM Sans',
                        //       fontWeight: FontWeight.bold),
                        // ),
                        ),
                    Container(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
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
                    Container(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
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
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
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
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
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
                    Container(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
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
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
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
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ' Confirm password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    //   height: 50,
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         child: Checkbox(
                    //           value: isChecked,
                    //           onChanged: (bool? newValue) {
                    //             setState(
                    //               () {
                    //                 isChecked = newValue!;
                    //               },
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //       Container(
                    //         width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    //         height: 50,
                    //         child: const Text(
                    //           'You have agreed with our',
                    //           style: TextStyle(
                    //               fontSize: 10, fontWeight: FontWeight.w500),
                    //         ),
                    //       ),
                    //       Container(
                    //         child: TextButton(
                    //           onPressed: () {},
                    //           child: const Text(
                    //             'Term & Condition',
                    //             style: TextStyle(
                    //               color: Color(0xFF1C5B41),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      //margin: const EdgeInsets.only(left: 38),
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
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginStu()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1DC99E),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
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
                                  MaterialPageRoute(
                                      builder: (context) => const LoginStu()),
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
          ),
        ),
      );
    });
  }
}

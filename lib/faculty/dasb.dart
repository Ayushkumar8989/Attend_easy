import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Dasb extends StatefulWidget {
  const Dasb({super.key});

  @override
  State<Dasb> createState() => _DasbState();
}

class _DasbState extends State<Dasb> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 600;
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        return Scaffold(
          body: Container(
            width: screenWidth * 1.0,
            height: screenHeight * (isDesktop ? 1.0 : 1.0),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: screenWidth * 0.8,
                  margin: EdgeInsets.only(top: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenWidth * 0.71,
                        child: Text(
                          'Hey Ayush11060!',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.09,
                        child: CircleAvatar(
                          child: Icon(Icons.account_circle),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: screenWidth * 0.8,
                  child: Text(
                    'Welcome back to AttendEasy!',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 0.01),
                Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenWidth * 0.35,
                        height: screenHeight * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffD9D9D9),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: screenWidth * 0.12,
                              height: screenHeight * 0.1,
                              //color: Color(0xff1C5B41),
                              margin: EdgeInsets.only(
                                right: screenWidth * 0.18,
                                top: 1,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Color(0xff1DC99E),
                                child: Icon(
                                  Icons.save,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.1,
                            ),
                            Container(
                              width: screenWidth * 0.3,
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: screenWidth * 0.2,
                                    height: screenHeight * 0.09,
                                    child: Text(
                                      'Attendance Reports',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1C5B41),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      size: 30,
                                      color: Color(0xff1C5B41),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.35,
                        height: screenHeight * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffD9D9D9),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: screenWidth * 0.12,
                              height: screenHeight * 0.1,
                              //color: Color(0xff1C5B41),
                              margin: EdgeInsets.only(
                                right: screenWidth * 0.18,
                                top: 1,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Color(0xff1DC99E),
                                child: Icon(
                                  Icons.save,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.1,
                            ),
                            Container(
                              width: screenWidth * 0.3,
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: screenWidth * 0.2,
                                    height: screenHeight * 0.09,
                                    child: Text(
                                      'Manages Courses',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1C5B41),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      size: 30,
                                      color: Color(0xff1C5B41),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: screenWidth * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenWidth * 0.35,
                        child: Text(
                          'Ongoing attendance',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DM Sans',
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.35,
                        child: Text(
                          'Ongoing attendance',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DM Sans',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.2,
                  child: Container(
                    width: screenWidth * 0.3,
                    child: Center(
                      child: Text(
                          'There in no longer attendance session Start a new one to take attendance'),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * 0.75,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'New Session',
                      style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1DC99E),
                      foregroundColor: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                // Container(
                //   child: BottomNavigationBar(
                //     type: BottomNavigationBarType.fixed,
                //     items: [
                //       BottomNavigationBarItem(
                //           icon: Icon(Icons.home), label: 'Home,'),
                //       BottomNavigationBarItem(
                //           icon: Icon(Icons.book), label: 'Booking,'),
                //       BottomNavigationBarItem(
                //           icon: Icon(Icons.account_box), label: 'Account,')
                //     ],
                //   ),
                // )

                Container(
                  width: screenHeight * (isDesktop ? 0.8 : 0.6),
                  margin: EdgeInsets.only(left: 45),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.book),
                        label: 'History',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

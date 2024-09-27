import 'package:attend_easy/faculty/new_session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      bool isDesktop = Constraints.maxWidth > 600;
      double screenWidth = Constraints.maxWidth;
      double screenHeight = Constraints.maxHeight;
      return Scaffold(
        body: Center(
          child: Container(
            width: screenWidth * 1.0,
            height: screenHeight * 1.0,
            child: Column(
              children: [
                Container(
                  width: screenWidth * (isDesktop ? 0.6 : 0.85),
                  margin: EdgeInsets.only(top: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: screenWidth * 0.71,
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
                        // width: screenWidth * 0.09,
                        child: CircleAvatar(
                          child: Icon(Icons.account_circle),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: screenWidth * (isDesktop ? 0.6 : 0.85),
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
                  width: screenWidth * (isDesktop ? 0.6 : 0.85),
                  height: screenHeight * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenWidth * (isDesktop ? 0.25 : 0.35),
                        height: screenHeight * 0.25,
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
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.05,
                            ),
                            Container(
                              width: screenWidth * 0.3,
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        screenWidth * (isDesktop ? 0.15 : 0.2),
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
                        width: screenWidth * (isDesktop ? 0.25 : 0.35),
                        height: screenHeight * 0.25,
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
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.05,
                            ),
                            Container(
                              width: screenWidth * 0.3,
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        screenWidth * (isDesktop ? 0.15 : 0.2),
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
                  width: screenWidth * (isDesktop ? 0.6 : 0.85),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenWidth * (isDesktop ? 0.25 : 0.35),
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
                        width: screenWidth * (isDesktop ? 0.25 : 0.35),
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'Finished Today',
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
                  width: screenWidth * 0.35,
                  height: screenHeight * 0.15,
                  child: Container(
                    width: screenWidth * 0.3,
                    child: Center(
                      child: Text(
                          'There in no longer attendance session Start a new one to take attendance'),
                    ),
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
                          builder: (context) => NewSession(),
                        ),
                      );
                    },
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
              ],
            ),
          ),
        ),
      );
    });
  }
}

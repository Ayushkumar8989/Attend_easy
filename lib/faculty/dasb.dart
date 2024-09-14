import 'dart:ui';

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.9,
        margin: EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Container(
              width: screenWidth * 0.8,
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth * 0.35,
                    height: screenHeight * 0.3,
                    color: Color(0xffD9D9D9),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  ),
                                ),
                              ),
                              Container(
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 30,
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
                    color: Color(0xffD9D9D9),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

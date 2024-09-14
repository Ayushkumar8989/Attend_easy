import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth * 0.39,
                    height: screenHeight * 0.3,
                    color: Color(0xffD9D9D9),
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth * 0.1,
                          color: Color(0xff1C5B41),
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
                          height: 140,
                        ),
                        Container(
                          width: screenWidth * 0.8,
                          margin: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Container(
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
                                child: Icon(Icons.arrow_forward),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.39,
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

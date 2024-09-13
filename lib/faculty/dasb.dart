import 'dart:ui';

import 'package:flutter/material.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth * 0.6,
                  margin: EdgeInsets.only(left: 45),
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
                  width: screenWidth * 0.2,
                  child: CircleAvatar(
                    child: Icon(Icons.account_circle),
                  ),
                )
              ],
            ),
            Container(
              width: screenWidth * 0.71,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: screenWidth * 0.35,
                    height: screenHeight * 0.4,
                    margin: EdgeInsets.only(left: 45),
                    color: Color(0xffD9D9D9),
                    child: Column(
                      children: [
                        Container(
                          child: CircleAvatar(
                            child: Icon(
                              Icons.save,
                              size: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    width: screenWidth * 0.35,
                    height: screenHeight * 0.4,
                    color: Color(0xffD9D9D9),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:attendance/faculty/decisionfac.dart';
import 'package:attendance/student/decisionstu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.5,
            child: Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: screenWidth * 0.10,
                      height: screenHeight * 0.1,
                      margin: EdgeInsets.only(top: 280),
                      child: Icon(
                        Icons.calendar_month,
                        size: 40,
                        color: Color(0xFF1C5B41),
                      )),
                  Container(
                      width: screenWidth * 0.60,
                      height: screenHeight * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/boy_study.jpg'),
                        ),
                      )),
                  Container(
                    width: screenWidth * 0.10,
                    height: screenHeight * 0.1,
                    margin: EdgeInsets.only(bottom: 280),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/open_book.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.2,
          ),
          Container(
            width: screenWidth * 0.75,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DecisionFac(),
                    ),
                    (route) => false);
              },
              child: Text(
                'I am a Lecturer',
                style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1DC99E),
                foregroundColor: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: screenWidth * 0.75,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DecisionStu(),
                    ),
                    (route) => false);
              },
              child: Text(
                'I am a Student',
                style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD9D9D9),
                foregroundColor: Color(0xFF1C5B41),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

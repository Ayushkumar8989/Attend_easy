import 'package:attend_easy/faculty/loginfac.dart';
import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.8,
        margin: EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Container(
              width: screenWidth * 0.8,
              child: Text(
                'User Verification!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: screenWidth * 0.8,
              child: Text(
                'We just sent a one-time password to your registered phone +91XX XX89 XX54 to make sure it’s you.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenWidth * 0.8,
              child: Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: screenWidth * 0.8,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              width: screenWidth * 0.8,
              child: Row(
                children: [
                  Container(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Reset OTP',
                        style: TextStyle(
                          color: Color(0xFF1C5B41),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      ' Didn’t receive OTP?',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth * 0.8,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginFac()),
                    );
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1DC99E),
                    foregroundColor: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

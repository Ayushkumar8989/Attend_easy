import 'package:attendance/faculty/loginfac.dart';
import 'package:attendance/faculty/signinfac.dart';
import 'package:flutter/material.dart';

class DecisionFac extends StatefulWidget {
  const DecisionFac({super.key});

  @override
  State<DecisionFac> createState() => _DecisionFacState();
}

class _DecisionFacState extends State<DecisionFac> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: screenWidth * 0.7,
            height: screenHeight * 0.5,
            margin: EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/studing_cloud_comp.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.15,
          ),
          Container(
            width: screenWidth * 0.75,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginFac(),
                  ),
                );
              },
              child: Text(
                'Login',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInFac(),
                  ),
                );
              },
              child: Text(
                'Signin',
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

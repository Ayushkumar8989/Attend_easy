import 'package:flutter/material.dart';

class AttendanceRep extends StatefulWidget {
  const AttendanceRep({super.key});

  @override
  State<AttendanceRep> createState() => _AttendanceRepState();
}

class _AttendanceRepState extends State<AttendanceRep> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      bool isDesktop = Constraints.maxWidth > 600;
      double screenWidth = Constraints.maxWidth;
      double screenHeight = Constraints.maxHeight;
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: screenWidth * 1.0,
              height: screenHeight * 1.0,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    child: const Center(
                      child: Text(
                        'Attendance Report',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 1.0,
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

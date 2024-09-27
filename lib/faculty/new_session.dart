import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewSession extends StatefulWidget {
  const NewSession({super.key});

  @override
  State<NewSession> createState() => _NewSessionState();
}

class _NewSessionState extends State<NewSession> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      bool isDesktop = Constraints.maxWidth > 600;
      double screenwidth = Constraints.maxWidth;
      double screenheight = Constraints.maxHeight;
      return Scaffold(
        body: Center(
          child: Container(
              width: screenwidth * 1.0,
              height: screenheight * 1.0,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: isDesktop ? 0.6 : 0.85,
                    height: 50,
                    margin: EdgeInsets.only(top: 70),
                    child: Text(
                      'New Attendance Session',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }
}

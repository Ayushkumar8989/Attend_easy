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
        body: Container(
          width: screenwidth * 1.0,
          height: screenheight * 1.0,
          color: Colors.white,
        ),
      );
    });
  }
}

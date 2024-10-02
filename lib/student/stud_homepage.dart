import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the date and time

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF43c6ac),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AttendEasyScreen(),
    );
  }
}

class AttendEasyScreen extends StatefulWidget {
  @override
  _AttendEasyScreenState createState() => _AttendEasyScreenState();
}

class _AttendEasyScreenState extends State<AttendEasyScreen> {
  String formattedTime = '';
  String formattedDate = '';
  Timer? timer; // For updating time periodically

  @override
  void initState() {
    super.initState();
    _updateDateTime(); // Get the initial time and date
    // Update time every second
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => _updateDateTime());
  }

  void _updateDateTime() {
    DateTime now = DateTime.now();
    setState(() {
      formattedTime =
          DateFormat('hh:mm:ss a').format(now); // Format time as 08:00 AM
      formattedDate = DateFormat('MMM dd yyyy - EEEE')
          .format(now); // Format date as Aug 04 2024 - Monday
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Stop the timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.grey[400]),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate responsive sizes based on layout constraints
          double height = constraints.maxHeight;
          double width = constraints.maxWidth;
          double textMultiplier =
              width * 0.06; // Text size responsive multiplier

          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hey Ayush11060!',
                    style: TextStyle(
                      fontSize: textMultiplier, // Responsive text size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'Welcome back to AttendEasy!',
                    style: TextStyle(
                      fontSize: width * 0.045, // Responsive text size
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Text(
                    formattedTime,
                    style: TextStyle(
                      fontSize: width * 0.15, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: width * 0.045, // Responsive font size
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: height * 0.08),
                  GestureDetector(
                    onTap: () {
                      _updateDateTime(); // Update time and date when button is tapped
                    },
                    child: Container(
                      height: width * 0.5,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: Color(0xFF43c6ac).withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF43c6ac),
                          width: 4,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.fingerprint,
                          color: Color(0xFF43c6ac),
                          size: width * 0.18, // Responsive icon size
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Color(0xFF43c6ac),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:attend_easy/student/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // If using Firestore
import 'package:geolocator/geolocator.dart'; // If using Geolocation

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF43c6ac),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AttendEasyScreen(),
    );
  }
}

class AttendEasyScreen extends StatefulWidget {
  const AttendEasyScreen({super.key});

  @override
  _AttendEasyScreenState createState() => _AttendEasyScreenState();
}

class _AttendEasyScreenState extends State<AttendEasyScreen> {
  String formattedTime = '';
  String formattedDate = '';
  String userName = ''; // User name fetched from SharedPreferences
  Timer? timer; // For updating time periodically
  TextEditingController sessionCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserName(); // Load user's name from SharedPreferences
    _updateDateTime(); // Get the initial time and date
    // Update time every second
    timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => _updateDateTime());
  }

  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? 'Guest'; // Fetch user name
    });
  }

  void _updateDateTime() {
    DateTime now = DateTime.now();
    setState(() {
      formattedTime = DateFormat('hh:mm:ss a').format(now);
      formattedDate = DateFormat('MMM dd yyyy - EEEE').format(now);
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Stop the timer when widget is disposed
    sessionCodeController.dispose();
    super.dispose();
  }

  void _showCheckInBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Check In",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Enter the session code provided by your lecturer to check in",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: sessionCodeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Session Code",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    validateSessionAndLocation(sessionCodeController.text);
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF43c6ac),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 12.0),
                  ),
                  child: const Text(
                    "Click to Check in",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Your validateSessionAndLocation method here...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double height = constraints.maxHeight;
          double width = constraints.maxWidth;

          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hey $userName!',
                    style: TextStyle(
                      fontSize: width * 0.06, // Responsive text size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'Welcome back to SmartAttend!',
                    style: TextStyle(
                      fontSize: width * 0.045,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    height: height * 0.25,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Current Time:",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            formattedTime,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF43c6ac),
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            formattedDate,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => _showCheckInBottomSheet(context),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFF43c6ac),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                    ),
                    child: const Text(
                      "Check In",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Color(0xFF43c6ac)),
              onPressed: () {
                // You can navigate to Home or perform any action you need
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AttendEasyScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle, color: Color(0xFF43c6ac)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void validateSessionAndLocation(String text) {}
}

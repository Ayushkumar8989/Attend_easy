import 'dart:async'; // Import for Timer
import 'dart:math';
import 'package:attend_easy/student/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the date and time
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:geolocator/geolocator.dart'; // Import Geolocator for location services

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

  // Method to load user's name from SharedPreferences
  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ??
          'Guest'; // Fetch the user name or set 'Guest' if not found
    });
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
    sessionCodeController.dispose();
    super.dispose();
  }

  void _showCheckInBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // To make sure the bottom sheet adapts to content size
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets, // Adjust for keyboard
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 300, // Set height for the bottom sheet
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
                  "Enter the session code that was provided by your lecturer to check in",
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
                    Navigator.pop(
                        context); // Close the bottom sheet after check-in
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

  Future<void> validateSessionAndLocation(String sessionCode) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      QuerySnapshot snapshot = await firestore
          .collection('attendance_sessions')
          .where('sessionCode', isEqualTo: sessionCode)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot docSnapshot = snapshot.docs.first;

        if (docSnapshot.exists && docSnapshot.data() != null) {
          var data = docSnapshot.data() as Map<String, dynamic>;

          if (data.containsKey('lecturer_latitude') &&
              data.containsKey('lecturer_longitude')) {
            double lecturerLatitude = data['lecturer_latitude'];
            double lecturerLongitude = data['lecturer_longitude'];
            double radius = data['radius'];

            // Get student's current location
            Position position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high);
            double studentLatitude = position.latitude;
            double studentLongitude = position.longitude;

            // Check if student is within range
            if (_isWithinRange(studentLatitude, studentLongitude,
                lecturerLatitude, lecturerLongitude, radius)) {
              // Save attendance to Firestore
              await saveAttendance(
                  sessionCode, studentLatitude, studentLongitude);
              print("Check-in successful!");
            } else {
              print("You are out of range for this session.");
            }
          } else {
            print(
                'Error: lecturer_latitude or lecturer_longitude fields do not exist in the document.');
          }
        } else {
          print('Session code not found.');
        }
      } else {
        print('Session code not found.');
      }
    } catch (e) {
      print('Error fetching session data: $e');
    }
  }

  // Check if student is within the radius of the lecturer's location
  bool _isWithinRange(double studentLat, double studentLng, double lecturerLat,
      double lecturerLng, double radius) {
    const double earthRadius = 6371000; // in meters

    // Haversine formula to calculate the distance
    double dLat = _toRadians(lecturerLat - studentLat);
    double dLng = _toRadians(lecturerLng - studentLng);
    double a = (sin(dLat / 2) * sin(dLat / 2)) +
        (cos(_toRadians(studentLat)) *
            cos(_toRadians(lecturerLat)) *
            sin(dLng / 2) *
            sin(dLng / 2));
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c; // in meters

    return distance <= radius; // Check if within radius
  }

  double _toRadians(double degree) {
    return degree * (pi / 180);
  }

  Future<void> saveAttendance(
      String sessionCode, double latitude, double longitude) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('attendance_history').add({
      'sessionCode': sessionCode,
      'userName': userName,
      'checkInTime': FieldValue.serverTimestamp(),
      'latitude': latitude,
      'longitude': longitude,
    });

    print("Attendance saved successfully.");
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
                  // Display dynamic user name from SharedPreferences
                  Text(
                    'Hey $userName!',
                    style: TextStyle(
                      fontSize: textMultiplier, // Responsive text size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'Welcome back to SmartAttend!',
                    style: TextStyle(
                      fontSize: width * 0.045, // Responsive text size
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
                    onPressed: () => _showCheckInBottomSheet(
                        context), // Show bottom sheet to check in
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
    );
  }
}

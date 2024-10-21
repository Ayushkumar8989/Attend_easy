// import 'package:flutter/material.dart';

// class NewSession extends StatefulWidget {
//   const NewSession({super.key});

//   @override
//   State<NewSession> createState() => _NewSessionState();
// }

// class _NewSessionState extends State<NewSession> {
//   final List<String> _dropDownItems = ['B.Tech', 'M.Tech', 'MBA', 'BBA', 'BCA'];
//   String _selectedItem = "B.Tech";
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, Constraints) {
//       bool isDesktop = Constraints.maxWidth > 600;
//       double screenWidth = Constraints.maxWidth;
//       double screenHeight = Constraints.maxHeight;
//       return Scaffold(
//         appBar: AppBar(
//             title: const Text(
//           'New Attendance Session',
//           style: TextStyle(
//               fontSize: 20,
//               color: Colors.black,
//               fontFamily: 'DM Sans',
//               fontWeight: FontWeight.bold),
//         )),
//         body: SingleChildScrollView(
//           child: Center(
//             child: Container(
//               width: screenWidth * 1.0,
//               height: screenHeight * 1.0,
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   // Container(
//                   //   width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                   //   height: 50,
//                   //   margin: const EdgeInsets.only(top: 70),
//                   //   child: const Text(
//                   //     'New Attendance Session',
//                   //     style: TextStyle(
//                   //         fontSize: 20,
//                   //         color: Colors.black,
//                   //         fontFamily: 'DM Sans',
//                   //         fontWeight: FontWeight.bold),
//                   //   ),
//                   // ),
//                   Container(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     height: 50,
//                     margin: const EdgeInsets.only(top: 10),
//                     child: const Text(
//                       'Course',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black,
//                         fontFamily: 'DM Sans',
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   // SizedBox(
//                   //   width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                   // ),
//                   SizedBox(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     height: 60,
//                     child: Center(
//                       child: Column(
//                         children: [
//                           DropdownButtonFormField(
//                             value: _selectedItem,
//                             items: _dropDownItems.map((String item) {
//                               return DropdownMenuItem(
//                                 value: item,
//                                 child: Text(item),
//                               );
//                             }).toList(),
//                             onChanged: (String? value) {
//                               setState(() {
//                                 _selectedItem = value!;
//                               });
//                             },
//                             icon: const Icon(Icons.arrow_drop_down),
//                             decoration: InputDecoration(
//                               hintText: ' Select Courses',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Container(
//                   //   width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                   //   height: 50,
//                   //   margin: EdgeInsets.only(top: 10),
//                   //   child: Text(
//                   //     'Date',
//                   //     style: TextStyle(
//                   //       fontSize: 20,
//                   //       color: Colors.black,
//                   //       fontFamily: 'DM Sans',
//                   //       fontWeight: FontWeight.bold,
//                   //     ),
//                   //   ),
//                   // ),
//                   Container(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     height: 50,
//                     margin: const EdgeInsets.only(top: 10),
//                     child: const Text(
//                       'Venue',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black,
//                         fontFamily: 'DM Sans',
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 10,
//                   // ),
//                   //margin: EdgeInsets.only(left: 45),
//                   SizedBox(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     height: 60,
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: ' Enter attendance venue',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 10,
//                   // ),
//                   Container(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     height: 50,
//                     margin: const EdgeInsets.only(top: 10),
//                     child: const Text(
//                       'Geolocation Radius',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black,
//                         fontFamily: 'DM Sans',
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 5,
//                   // ),
//                   SizedBox(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     height: 60,
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: ' Enter raduis in meter',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     height: 50,
//                     margin: const EdgeInsets.only(top: 10),
//                     child: const Text(
//                       'Code Duration',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black,
//                         fontFamily: 'DM Sans',
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 5,
//                   // ), //margin: EdgeInsets.only(left: 45),
//                   SizedBox(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     height: 60,
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: ' Enter duration in minutes',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 5,
//                   // ),

//                   // child: ElevatedButton(
//                   //   onPressed: () {},
//                   //   style: ElevatedButton.styleFrom(
//                   //     backgroundColor: const Color(0xFF1DC99E),
//                   //     foregroundColor: Colors.white,
//                   //   ),
//                   //   child: const Text(
//                   //     'Generate Session Code',
//                   //     style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
//                   //   ),
//                   // ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () => showDialog<String>(
//                         context: context,
//                         builder: (BuildContext context) => AlertDialog(
//                           title: const Center(
//                             child: Text(
//                               '123456',
//                               style: TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Inter'),
//                             ),
//                           ),
//                           content: const Text(
//                             'This code will expire in the next 10 minutes',
//                             style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
//                           ),
//                           actions: <Widget>[
//                             ElevatedButton(
//                               onPressed: () => Navigator.pop(context, 'Cancel'),
//                               child: const Text(
//                                 'Cancel',
//                                 style: TextStyle(
//                                     fontSize: 20, fontFamily: 'Inter'),
//                               ),
//                             ),
//                             ElevatedButton(
//                               //onPressed: () => Navigator.pop(context, 'Start'),
//                               onPressed: () {},
//                               child: const Text(
//                                 'Start',
//                                 style: TextStyle(
//                                     fontSize: 20, fontFamily: 'Inter'),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF1DC99E),
//                         foregroundColor: Colors.white,
//                       ),
//                       child: const Text(
//                         'Generate Session Code',
//                         style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }

import 'package:attend_easy/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Session());
}

class Session extends StatelessWidget {
  const Session({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewAttendanceSessionScreen(),
    );
  }
}

class NewAttendanceSessionScreen extends StatefulWidget {
  const NewAttendanceSessionScreen({super.key});

  @override
  _NewAttendanceSessionScreenState createState() =>
      _NewAttendanceSessionScreenState();
}

class _NewAttendanceSessionScreenState
    extends State<NewAttendanceSessionScreen> {
  final Random _random = Random();
  String _generatedCode = '';
  String?
      selectedCourse; // Declare this at the top of your stateful widget class

  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _radiusController = TextEditingController();
  LocationData? _locationData;
  final Location _location = Location();
  Timer? _locationTimer;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  @override
  void dispose() {
    _locationTimer?.cancel();
    _durationController.dispose();
    _radiusController.dispose();
    super.dispose();
  }

  Future<void> _requestLocationPermission() async {
    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) return; // Service not enabled
      }

      PermissionStatus permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return; // Permission not granted
        }
      }

      // Get location data after permission is granted
      _locationData = await _location.getLocation();
    } catch (e) {
      _showErrorDialog("Error requesting location permissions: $e");
    }
  }

  void _confirmSessionCodeGeneration() {
    if (_locationData == null) {
      _showErrorDialog(
          "Location data not available. Please grant permissions.");
      return;
    }

    // Parse duration and radius input
    final int duration = int.tryParse(_durationController.text) ?? 0;
    final int radius = int.tryParse(_radiusController.text) ?? 0;

    if (duration <= 0 || radius <= 0) {
      _showErrorDialog("Please enter valid values for duration and radius.");
      return;
    }

    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Session Code Generation'),
          content: Text('You are about to generate a session code with:\n\n'
              'Duration: $duration minutes\n'
              'Radius: $radius meters\n\n'
              'Do you want to proceed?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                _generateSessionCode(
                    duration, radius); // Proceed with code generation
              },
            ),
          ],
        );
      },
    );
  }

  void _generateSessionCode(int duration, int radius) {
    // Generate a new session code
    setState(() {
      _generatedCode = (_random.nextInt(900000) + 100000).toString();
    });

    // Store session data in Firestore
    _storeSessionData(_generatedCode, duration, radius, _locationData!);
    _showCodeDialog(_generatedCode, duration, radius);

    // Start timers for session expiry and location checking
    _startSessionExpiry(duration);
    _startLocationChecking(radius);
  }

  void _startSessionExpiry(int duration) {
    Timer(Duration(minutes: duration), () {
      _deleteSessionData(_generatedCode);
      setState(() {
        _generatedCode = 'Expired'; // Update UI to show expired code
      });
      _showExpiredDialog();
    });
  }

  void _startLocationChecking(int radius) {
    _locationTimer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      final LocationData userLocation = await _location.getLocation();
      if (_isWithinRadius(userLocation, _locationData!, radius)) {
        print('User is within the range');
      } else {
        print('User is outside the range');
      }
    });
  }

  Future<void> _storeSessionData(
      String code, int duration, int radius, LocationData locationData) async {
    try {
      await _firestore.collection('attendance_sessions').add({
        'code': code,
        'lecturer_latitude': locationData.latitude,
        'lecturer_longitude': locationData.longitude,
        'radius': radius,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      _showErrorDialog('Failed to store session data: $e');
    }
  }

  Future<void> _deleteSessionData(String code) async {
    try {
      final querySnapshot = await _firestore
          .collection('attendance_sessions')
          .where('code', isEqualTo: code)
          .get();

      // Delete all documents with the specified session code
      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      _showErrorDialog('Failed to delete session data: $e');
    }
  }

  bool _isWithinRadius(
      LocationData userLocation, LocationData sessionLocation, int radius) {
    final double distance = _calculateDistance(
      userLocation.latitude!,
      userLocation.longitude!,
      sessionLocation.latitude!,
      sessionLocation.longitude!,
    );
    return distance <= radius; // Check if within specified radius
  }

  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double p = 0.017453292519943295; // Math.PI / 180
    final double lat1Rad = lat1 * p;
    final double lon1Rad = lon1 * p;
    final double lat2Rad = lat2 * p;
    final double lon2Rad = lon2 * p;

    final double dLat = lat2Rad - lat1Rad;
    final double dLon = lon2Rad - lon1Rad;

    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1Rad) * cos(lat2Rad) * sin(dLon / 2) * sin(dLon / 2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    const double R = 6371; // Radius of Earth in kilometers
    return R * c * 1000; // Convert to meters
  }

  void _showCodeDialog(String code, int duration, int radius) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Session Code'),
          content: Text(
              'Your session code is: $code\n\nIt will expire in $duration minutes and is valid within $radius meters.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showExpiredDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Session Code Expired'),
          content: const Text(
              'The session code has expired. Please generate a new code.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Session Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Course',
                border: OutlineInputBorder(),
              ),
              items: const <String>[
                'Course 1',
                'Course 2',
                'Course 3',
                'Course 4',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedCourse = value; // Update the selected course
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _durationController,
              decoration: const InputDecoration(
                labelText: 'Duration (minutes)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _radiusController,
              decoration: const InputDecoration(
                labelText: 'Radius (meters)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _confirmSessionCodeGeneration,
              child: const Text('Generate Session Code'),
            ),
            const SizedBox(height: 20),
            if (_generatedCode.isNotEmpty)
              Text(
                'Generated Session Code: $_generatedCode',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

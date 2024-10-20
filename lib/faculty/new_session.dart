// import 'package:attend_easy/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'dart:async';
// import 'package:location/location.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const Session());
// }

// class Session extends StatelessWidget {
//   const Session({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: NewAttendanceSessionScreen(),
//     );
//   }
// }

// class NewAttendanceSessionScreen extends StatefulWidget {
//   const NewAttendanceSessionScreen({Key? key}) : super(key: key);

//   @override
//   _NewAttendanceSessionScreenState createState() =>
//       _NewAttendanceSessionScreenState();
// }

// class _NewAttendanceSessionScreenState
//     extends State<NewAttendanceSessionScreen> {
//   final Random _random = Random();
//   String _generatedCode = '';
//   String?
//       selectedCourse; // Declare this at the top of your stateful widget class

//   final TextEditingController _durationController = TextEditingController();
//   final TextEditingController _radiusController = TextEditingController();
//   LocationData? _locationData;
//   final Location _location = Location();
//   Timer? _locationTimer;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   void initState() {
//     super.initState();
//     _requestLocationPermission();
//   }

//   @override
//   void dispose() {
//     _locationTimer?.cancel();
//     _durationController.dispose();
//     _radiusController.dispose();
//     super.dispose();
//   }

//   Future<void> _requestLocationPermission() async {
//     try {
//       bool serviceEnabled = await _location.serviceEnabled();
//       if (!serviceEnabled) {
//         serviceEnabled = await _location.requestService();
//         if (!serviceEnabled) return; // Service not enabled
//       }

//       PermissionStatus permissionGranted = await _location.hasPermission();
//       if (permissionGranted == PermissionStatus.denied) {
//         permissionGranted = await _location.requestPermission();
//         if (permissionGranted != PermissionStatus.granted)
//           return; // Permission not granted
//       }

//       // Get location data after permission is granted
//       _locationData = await _location.getLocation();
//     } catch (e) {
//       _showErrorDialog("Error requesting location permissions: $e");
//     }
//   }

//   void _confirmSessionCodeGeneration() {
//     if (_locationData == null) {
//       _showErrorDialog(
//           "Location data not available. Please grant permissions.");
//       return;
//     }

//     // Parse duration and radius input
//     final int duration = int.tryParse(_durationController.text) ?? 0;
//     final int radius = int.tryParse(_radiusController.text) ?? 0;

//     if (duration <= 0 || radius <= 0) {
//       _showErrorDialog("Please enter valid values for duration and radius.");
//       return;
//     }

//     // Show confirmation dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Confirm Session Code Generation'),
//           content: Text('You are about to generate a session code with:\n\n'
//               'Duration: $duration minutes\n'
//               'Radius: $radius meters\n\n'
//               'Do you want to proceed?'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close dialog
//               },
//             ),
//             TextButton(
//               child: const Text('Confirm'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close dialog
//                 _generateSessionCode(
//                     duration, radius); // Proceed with code generation
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _generateSessionCode(int duration, int radius) {
//     // Generate a new session code
//     setState(() {
//       _generatedCode = (_random.nextInt(900000) + 100000).toString();
//     });

//     // Store session data in Firestore
//     _storeSessionData(_generatedCode, duration, radius, _locationData!);
//     _showCodeDialog(_generatedCode, duration, radius);

//     // Start timers for session expiry and location checking
//     _startSessionExpiry(duration);
//     _startLocationChecking(radius);
//   }

//   void _startSessionExpiry(int duration) {
//     Timer(Duration(minutes: duration), () {
//       _deleteSessionData(_generatedCode);
//       setState(() {
//         _generatedCode = 'Expired'; // Update UI to show expired code
//       });
//       _showExpiredDialog();
//     });
//   }

//   void _startLocationChecking(int radius) {
//     _locationTimer = Timer.periodic(const Duration(seconds: 10), (timer) async {
//       final LocationData userLocation = await _location.getLocation();
//       if (_isWithinRadius(userLocation, _locationData!, radius)) {
//         print('User is within the range');
//       } else {
//         print('User is outside the range');
//       }
//     });
//   }

//   Future<void> _storeSessionData(
//       String code, int duration, int radius, LocationData locationData) async {
//     try {
//       await _firestore.collection('attendance_sessions').add({
//         'sessionCode': code,
//         'lecturer_latitude': locationData.latitude,
//         'lecturer_longitude': locationData.longitude,
//         'radius': radius,
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       _showErrorDialog('Failed to store session data: $e');
//     }
//   }

//   Future<void> _deleteSessionData(String code) async {
//     try {
//       final querySnapshot = await _firestore
//           .collection('attendance_sessions')
//           .where('code', isEqualTo: code)
//           .get();

//       // Delete all documents with the specified session code
//       for (var doc in querySnapshot.docs) {
//         await doc.reference.delete();
//       }
//     } catch (e) {
//       _showErrorDialog('Failed to delete session data: $e');
//     }
//   }

//   bool _isWithinRadius(
//       LocationData userLocation, LocationData sessionLocation, int radius) {
//     final double distance = _calculateDistance(
//       userLocation.latitude!,
//       userLocation.longitude!,
//       sessionLocation.latitude!,
//       sessionLocation.longitude!,
//     );
//     return distance <= radius; // Check if within specified radius
//   }

//   double _calculateDistance(
//       double lat1, double lon1, double lat2, double lon2) {
//     const double p = 0.017453292519943295; // Math.PI / 180
//     final double lat1Rad = lat1 * p;
//     final double lon1Rad = lon1 * p;
//     final double lat2Rad = lat2 * p;
//     final double lon2Rad = lon2 * p;

//     final double dLat = lat2Rad - lat1Rad;
//     final double dLon = lon2Rad - lon1Rad;

//     final double a = sin(dLat / 2) * sin(dLat / 2) +
//         cos(lat1Rad) * cos(lat2Rad) * sin(dLon / 2) * sin(dLon / 2);

//     final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

//     const double R = 6371; // Radius of Earth in kilometers
//     return R * c * 1000; // Convert to meters
//   }

//   void _showCodeDialog(String code, int duration, int radius) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Session Code'),
//           content: Text(
//               'Your session code is: $code\n\nIt will expire in $duration minutes and is valid within $radius meters.'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showExpiredDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Session Code Expired'),
//           content: const Text(
//               'The session code has expired. Please generate a new code.'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Error'),
//           content: Text(message),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Generate Session Code'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 labelText: 'Select Course',
//                 border: OutlineInputBorder(),
//               ),
//               items: const <String>[
//                 'Course 1',
//                 'Course 2',
//                 'Course 3',
//                 'Course 4',
//               ].map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? value) {
//                 setState(() {
//                   selectedCourse = value; // Update the selected course
//                 });
//               },
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _durationController,
//               decoration: const InputDecoration(
//                 labelText: 'Duration (minutes)',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _radiusController,
//               decoration: const InputDecoration(
//                 labelText: 'Radius (meters)',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _confirmSessionCodeGeneration,
//               child: const Text('Generate Session Code'),
//             ),
//             const SizedBox(height: 20),
//             if (_generatedCode.isNotEmpty)
//               Text(
//                 'Generated Session Code: $_generatedCode',
//                 style:
//                     const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//           ],
//         ),
//       ),
//     );
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
  const Session({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewAttendanceSessionScreen(),
    );
  }
}

class NewAttendanceSessionScreen extends StatefulWidget {
  const NewAttendanceSessionScreen({Key? key}) : super(key: key);

  @override
  _NewAttendanceSessionScreenState createState() =>
      _NewAttendanceSessionScreenState();
}

class _NewAttendanceSessionScreenState
    extends State<NewAttendanceSessionScreen> {
  final Random _random = Random();
  String _generatedCode = '';
  String? selectedCourse;

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
        if (!serviceEnabled) return;
      }

      PermissionStatus permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) return;
      }

      // Start location service to get the latest location
      _location.onLocationChanged.listen((LocationData currentLocation) {
        setState(() {
          _locationData = currentLocation; // Update the current location
        });
      });

      // Get the initial location data
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
      if (_locationData != null) {
        final userLocation = await _location.getLocation();
        if (_isWithinRadius(userLocation, _locationData!, radius)) {
          print('User is within the range');
        } else {
          print('User is outside the range');
        }
      }
    });
  }

  Future<void> _storeSessionData(
      String code, int duration, int radius, LocationData locationData) async {
    try {
      await _firestore.collection('attendance_sessions').add({
        'sessionCode': code,
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
          .where('sessionCode', isEqualTo: code) // Ensure correct field name
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
        title: const Text('New Attendance Session'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Duration (minutes):',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: _durationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Enter duration'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Radius (meters):',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Enter radius'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _confirmSessionCodeGeneration,
              child: const Text('Generate Session Code'),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:async'; // Import for Timer
// import 'package:attend_easy/student/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // For formatting the date and time
// import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF43c6ac),
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: AttendEasyScreen(),
//     );
//   }
// }

// class AttendEasyScreen extends StatefulWidget {
//   const AttendEasyScreen({super.key});

//   @override
//   _AttendEasyScreenState createState() => _AttendEasyScreenState();
// }

// class _AttendEasyScreenState extends State<AttendEasyScreen> {
//   String formattedTime = '';
//   String formattedDate = '';
//   String userName = ''; // User name fetched from SharedPreferences
//   Timer? timer; // For updating time periodically
//   TextEditingController sessionCodeController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadUserName(); // Load user's name from SharedPreferences
//     _updateDateTime(); // Get the initial time and date
//     // Update time every second
//     timer = Timer.periodic(
//         const Duration(seconds: 1), (Timer t) => _updateDateTime());
//   }

//   // Method to load user's name from SharedPreferences
//   Future<void> _loadUserName() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       userName = prefs.getString('name') ??
//           'Guest'; // Fetch the user name or set 'Guest' if not found
//     });
//   }

//   void _updateDateTime() {
//     DateTime now = DateTime.now();
//     setState(() {
//       formattedTime =
//           DateFormat('hh:mm:ss a').format(now); // Format time as 08:00 AM
//       formattedDate = DateFormat('MMM dd yyyy - EEEE')
//           .format(now); // Format date as Aug 04 2024 - Monday
//     });
//   }

//   @override
//   void dispose() {
//     timer?.cancel(); // Stop the timer when widget is disposed
//     sessionCodeController.dispose();
//     super.dispose();
//   }

//   void _showCheckInBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled:
//           true, // To make sure the bottom sheet adapts to content size
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: MediaQuery.of(context).viewInsets, // Adjust for keyboard
//           child: Container(
//             padding: const EdgeInsets.all(16.0),
//             height: 300, // Set height for the bottom sheet
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text(
//                   "Check In",
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 8.0),
//                 Text(
//                   "Enter the session code that was provided by your lecturer to check in",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 14.0,
//                     color: Colors.grey[700],
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextField(
//                   controller: sessionCodeController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     labelText: "Session Code",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Here you can add the functionality to handle check-in
//                     print("Session Code: ${sessionCodeController.text}");
//                     Navigator.pop(
//                         context); // Close the bottom sheet after check-in
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: const Color(0xFF43c6ac),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 32.0, vertical: 12.0),
//                   ),
//                   child: const Text(
//                     "Click to Check in",
//                     style: TextStyle(fontSize: 16.0),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.account_circle, color: Colors.grey[400]),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           // Calculate responsive sizes based on layout constraints
//           double height = constraints.maxHeight;
//           double width = constraints.maxWidth;
//           double textMultiplier =
//               width * 0.06; // Text size responsive multiplier

//           return Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Display dynamic user name from SharedPreferences
//                   Text(
//                     'Hey $userName!',
//                     style: TextStyle(
//                       fontSize: textMultiplier, // Responsive text size
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: height * 0.01),
//                   Text(
//                     'Welcome back to SmartAttend!',
//                     style: TextStyle(
//                       fontSize: width * 0.045, // Responsive text size
//                       color: Colors.grey,
//                     ),
//                   ),
//                   SizedBox(height: height * 0.05),
//                   Text(
//                     formattedTime,
//                     style: TextStyle(
//                       fontSize: width * 0.15, // Responsive font size
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: height * 0.01),
//                   Text(
//                     formattedDate,
//                     style: TextStyle(
//                       fontSize: width * 0.045, // Responsive font size
//                       color: Colors.grey,
//                     ),
//                   ),
//                   SizedBox(height: height * 0.08),
//                   GestureDetector(
//                     onTap: () {
//                       _showCheckInBottomSheet(
//                           context); // Show the bottom sheet when tapped
//                     },
//                     child: Container(
//                       height: width * 0.5,
//                       width: width * 0.5,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF43c6ac).withOpacity(0.1),
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: const Color(0xFF43c6ac),
//                           width: 4,
//                         ),
//                       ),
//                       child: Center(
//                         child: Icon(
//                           Icons.fingerprint,
//                           color: const Color(0xFF43c6ac),
//                           size: width * 0.18, // Responsive icon size
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         selectedItemColor: const Color(0xFF43c6ac),
//         unselectedItemColor: Colors.grey,
//         onTap: (int index) {
//           if (index == 2) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfileScreen()),
//             );
//           }
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async'; // Import for Timer
import 'package:attend_easy/student/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the date and time
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

void main() {
  runApp(MyApp());
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
      home: AttendEasyScreen(),
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

  // Method to show the check-in bottom sheet
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
                  onPressed: () async {
                    // Check in logic with a pop-up confirmation
                    String sessionCode = sessionCodeController.text;

                    bool checkInSuccessful = await _checkInStudent(sessionCode);

                    // Show confirmation message
                    _showCheckInConfirmation(context, checkInSuccessful);
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

  // Mock check-in method
  Future<bool> _checkInStudent(String sessionCode) async {
    // Simulating a network request
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return sessionCode
        .isNotEmpty; // Simulate success if session code is not empty
  }

  // Method to show confirmation dialog
  void _showCheckInConfirmation(BuildContext context, bool successful) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(successful ? 'Check-In Successful' : 'Check-In Failed'),
          content: Text(successful
              ? 'You have successfully checked in.'
              : 'Please check your session code and try again.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
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
                      _showCheckInBottomSheet(
                          context); // Show the bottom sheet when tapped
                    },
                    child: Container(
                      height: width * 0.5,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: const Color(0xFF43c6ac).withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF43c6ac),
                          width: 4,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.fingerprint,
                          color: const Color(0xFF43c6ac),
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
        selectedItemColor: const Color(0xFF43c6ac),
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
        items: const [
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

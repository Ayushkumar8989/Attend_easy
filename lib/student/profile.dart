import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

<<<<<<< Updated upstream
class _MyWidgetState extends State<MyWidget> {
=======
class MyApp extends StatelessWidget {
  const MyApp({super.key});

>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
<<<<<<< Updated upstream
}
=======
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF1DC99E), // Custom color
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/profile_pic.jpg'), // Replace with actual image
            ),
            const SizedBox(height: 10),
            const Text(
              'SHIVAM KUMAR',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              'skumar988@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF1DC99E), // Custom color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildInfoBox('PROGRAM', 'UIT'),
                  buildInfoBox('SEMESTER', 'SEM-V'),
                  buildInfoBox('ENROLLMENT NO', '22SOEIT11057670'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildSectionTitle('Personal Details'),
            buildDetailItem('Email', 'skumar988@rku.ac.in'),
            buildDetailItem('Gender', 'Male'),
            buildDetailItem('Date Of Birth', '15/03/2344'),
            buildDetailItem('Aadhar No', '2889420024744160'),
            buildDetailItem('Mobile No', '9431844y498699'),
            buildDetailItem('ABC ID', '644980989274774735'),
            const SizedBox(height: 20),
            // Add more sections like Academic Details, Contact Details if needed
          ],
        ),
      ),
    );
  }

  Widget buildInfoBox(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.white70),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
>>>>>>> Stashed changes

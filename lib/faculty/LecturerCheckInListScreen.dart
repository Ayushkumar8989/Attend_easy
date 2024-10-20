import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckInListPage extends StatelessWidget {
  final String sessionCode; // Code for the attendance session

  CheckInListPage({Key? key, required this.sessionCode}) : super(key: key);

  Future<List<Map<String, dynamic>>> _getCheckedInStudents() async {
    List<Map<String, dynamic>> students = [];

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('attendance_sessions')
          .doc(sessionCode)
          .collection('check_ins')
          .get();

      if (querySnapshot.docs.isEmpty) {
        print('No students have checked in for this session.');
        return students; // Return empty list if no documents
      }

      for (var doc in querySnapshot.docs) {
        students.add({
          'name': doc['student_name'],
          'email': doc['email'],
          'checkedInAt': doc['timestamp'],
          'latitude': doc['latitude'],
          'longitude': doc['longitude'],
        });
      }
    } catch (e) {
      print('Failed to load checked-in students: $e');
    }

    return students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checked-In Students'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getCheckedInStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final students = snapshot.data ?? [];

          if (students.isEmpty) {
            return const Center(child: Text('No students have checked in.'));
          }

          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              final dateTime = (student['timestamp'] as Timestamp)
                  .toDate(); // Convert to DateTime

              return ListTile(
                title: Text(student['student_name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text('Email: ${student['email']}'),
                    Text('Checked in at: ${dateTime.toLocal()}'),
                    Text(
                        'Location: ${student['latitude']}, ${student['longitude']}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MAnagesCourses extends StatefulWidget {
  const MAnagesCourses({super.key});

  @override
  State<MAnagesCourses> createState() => _MAnagesCoursesState();
}

class _MAnagesCoursesState extends State<MAnagesCourses> {
  List<Map<String, dynamic>> courses = [
    {"course": "Flutter"},
    {"course": ".NET"},
    {"course": "Data Science"},
    {"course": "CCT"},
    {"course": "Python"},
    {"course": "Swift"},
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Courses'),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: '2022/23'),
              Tab(text: '2023/24'),
              Tab(text: '2024/25')
            ],
          ),
        ),
        body: Expanded(
          child: ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.file_copy, color: Colors.blue),
                ),
                title: Text(courses[index]['course']),
                trailing: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.delete, color: Colors.black),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

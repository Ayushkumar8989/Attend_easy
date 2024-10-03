import 'package:flutter/material.dart';

class AttendanceRep extends StatefulWidget {
  const AttendanceRep({super.key});

  @override
  State<AttendanceRep> createState() => _AttendanceRepState();
}

class _AttendanceRepState extends State<AttendanceRep> {
  List<Map<String, dynamic>> students = [
    {"id": "22SOEIT11060", "attendance": "80"},
    {"id": "22SOEIT11061", "attendance": "80"},
    {"id": "22SOEIT11062", "attendance": "80"},
    {"id": "22SOEIT11063", "attendance": "80"},
    {"id": "22SOEIT11064", "attendance": "80"},
    {"id": "22SOEIT11065", "attendance": "80"},
    {"id": "22SOEIT11066", "attendance": "80"},
    {"id": "22SOEIT11067", "attendance": "80"}
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      bool isDesktop = Constraints.maxWidth > 600;
      double screenWidth = Constraints.maxWidth;
      double screenHeight = Constraints.maxHeight;
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: const Text('Attendance Report')),
            bottom: const TabBar(
              tabs: [Tab(text: 'flutter'), Tab(text: '.Net'), Tab(text: 'Php')],
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: screenWidth * 1.0,
                height: screenHeight * 1.0,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * (isDesktop ? 0.6 : 0.9),
                      margin: EdgeInsets.only(top: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            hintText: 'Search Student attendance',
                            suffixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(),
                            )),
                      ),
                    ),
                    Container(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      child: ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Color(0xD9D9D9),
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            title: Text(students[index]['id']),
                            trailing: Text('${students[index]['attendance']}%'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewSession extends StatefulWidget {
  const NewSession({super.key});

  @override
  State<NewSession> createState() => _NewSessionState();
}

class _NewSessionState extends State<NewSession> {
  final List<String> _dropDownItems = ['B.Tech', 'M.Tech', 'MBA', 'BBA', 'BCA'];
  String _selectedItem = "B.Tech";
  final String _selectedTextFieldItem = 'B.Tech';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      bool isDesktop = Constraints.maxWidth > 600;
      double screenWidth = Constraints.maxWidth;
      double screenHeight = Constraints.maxHeight;
      return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     'New Attendance Session',
        //     style: TextStyle(
        //         fontSize: 20,
        //         color: Colors.black,
        //         fontFamily: 'DM Sans',
        //         fontWeight: FontWeight.bold),
        //   ),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: screenWidth * 1.0,
              height: screenHeight * 1.0,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    //width: screenWidth * 0.7,
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    margin: const EdgeInsets.only(top: 70),
                    child: const Text(
                      'New Attendance Session',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Course',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    child: Center(
                      child: Column(
                        children: [
                          DropdownButtonFormField(
                            value: _selectedItem,
                            items: _dropDownItems.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedItem = value!;
                              });
                            },
                            icon: const Icon(Icons.arrow_drop_down),
                            decoration: InputDecoration(
                              hintText: ' Select Courses',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   width: screenWidth * (isDesktop ? 0.6 : 0.85),
                  //   height: 50,
                  //   margin: EdgeInsets.only(top: 10),
                  //   child: Text(
                  //     'Date',
                  //     style: TextStyle(
                  //       fontSize: 20,
                  //       color: Colors.black,
                  //       fontFamily: 'DM Sans',
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Venue',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    //margin: EdgeInsets.only(left: 45),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: ' Enter attendance venue',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Geolocation Radius',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    //margin: EdgeInsets.only(left: 45),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: ' Enter raduis in meter',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Code Duration',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    //margin: EdgeInsets.only(left: 45),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: ' Enter duration in minutes',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1DC99E),
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        'Generate Session Code',
                        style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

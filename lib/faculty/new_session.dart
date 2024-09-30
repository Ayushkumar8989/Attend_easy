import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewSession extends StatefulWidget {
  const NewSession({super.key});

  @override
  State<NewSession> createState() => _NewSessionState();
}

class _NewSessionState extends State<NewSession> {
  List<String> _dropDownItems = ['B.Tech', 'M.Tech', 'MBA', 'BBA', 'BCA'];
  String _selectedItem = "B.Tech";
  String _selectedTextFieldItem = 'B.Tech';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      bool isDesktop = Constraints.maxWidth > 600;
      double screenWidth = Constraints.maxWidth;
      double screenHeight = Constraints.maxHeight;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'New Attendance Session',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
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
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Course',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
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
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

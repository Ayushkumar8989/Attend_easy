import 'package:attend_easy/admin/AttendancePage.dart';
import 'package:attend_easy/admin/DashboardPage.dart';
import 'package:attend_easy/admin/UserManagementPage.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(AdminPanelApp());
}

class AdminPanelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AdminPanel(),
    );
  }
}

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          appBar: AppBar(title: Text('Admin Panel')),
          drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? _buildDrawer(context)
              : null,
          body: Row(
            children: [
              if (sizingInformation.deviceScreenType != DeviceScreenType.mobile)
                _buildDrawer(context, isSideNav: true),
              Expanded(child: DashboardPage()), // Default page
            ],
          ),
        );
      },
    );
  }

  Widget _buildDrawer(BuildContext context, {bool isSideNav = false}) {
    return Container(
      width: isSideNav ? 200 : null,
      child: Drawer(
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Admin Menu', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: Text('Dashboard'),
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (_) => ));
            // },
          ),
          ListTile(
            title: Text('User Management'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => UserManagementPage()));
            },
          ),
          ListTile(
            title: Text('Attendance Overview'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AttendancePage()));
            },
          ),
        ]),
      ),
    );
  }
}

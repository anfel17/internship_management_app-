import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/drawer/navDrawer.dart';
import 'package:internship_management_system/screens/bottomNavBar/bottomNavBar.dart';

class applicationDetailsScreen extends StatelessWidget {
  static String routeName = "/applicationDetailsScreen";
  final Map<String, dynamic> data;

  const applicationDetailsScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3A96B4),
        title: Container(
            width: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text("Internify")
        ),
      ),
      drawer: NavDrawer(),
      body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Application details'),
        Text('Theme: ${data['theme']}'),
        Text('Status: ${data['status']}'),
        Text('Status: ${data['status']}'),

      ],
    ),
    ),
      bottomNavigationBar: MyBottomNavigationBar() ,
    );
  }
}
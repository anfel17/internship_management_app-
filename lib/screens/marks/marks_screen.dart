import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/drawer/navDrawer.dart';
import 'package:internship_management_system/screens/bottomNavBar/bottomNavBar.dart';
import 'components/body.dart';


class MarksScreen extends StatelessWidget {
  static String routeName = "/MarksScreen";
  @override
  Widget build(BuildContext context) {
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
      body: Body(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

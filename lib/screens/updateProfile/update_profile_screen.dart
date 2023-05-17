import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/drawer/navDrawer.dart';
import 'package:internship_management_system/screens/bottomNavBar/bottomNavBar.dart';
import 'components/body.dart';


class UpdateProfileScreen extends StatelessWidget {
  static String routeName = "/UpdateProfileScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3A96B4),
        elevation: 0,
        title: Text("My Profile"),
      ),
      drawer: NavDrawer(),
      body: Body(),
        bottomNavigationBar: MyBottomNavigationBar(selectedIndex: 1)
    );
  }
}

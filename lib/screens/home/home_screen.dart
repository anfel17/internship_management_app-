import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/drawer/navDrawer.dart';
import 'package:internship_management_system/screens/notifications/notification_screen.dart';
import 'package:internship_management_system/screens/bottomNavBar/bottomNavBar.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/HomeScreen";

  final TextEditingController _searchController = TextEditingController();

  void _submitSearch(String value) {
    print("Search for $value");
  }

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

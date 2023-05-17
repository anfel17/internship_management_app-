import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/drawer/navDrawer.dart';
import 'package:internship_management_system/screens/notifications/notification_screen.dart';
import 'package:internship_management_system/screens/bottomNavBar/bottomNavBar.dart';
import 'components/body.dart';


class newApplicationScreen extends StatelessWidget {
  static String routeName = "/newApplicationScreen";



  @override
  Widget build(BuildContext context) {

    // You have to call it on your starting screen
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF3A96B4),
       ),
      drawer: NavDrawer(),
      body: Body(),
        bottomNavigationBar: MyBottomNavigationBar(selectedIndex: 0)
    );
  }
}

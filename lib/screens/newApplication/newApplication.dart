import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          title: Container(
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),

              ),
              child: Text("Internify", style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color:Colors.lightBlue[50],
              ),)
          ),
        ),
      drawer: NavDrawer(),
      body: Body(),
        bottomNavigationBar: MyBottomNavigationBar(selectedIndex: 0)
    );
  }
}

import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/home/home_screen.dart';
import 'package:internship_management_system/screens/myApplications/myApplication_screen.dart';
import 'package:internship_management_system/screens/newApplication/newApplication.dart';
import 'package:internship_management_system/screens/marks/marks_screen.dart';
import 'package:internship_management_system/screens/myAttendance/attendance_screen.dart';
import '../login/login_screen.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF276887), Colors.lightBlue[50]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
            child:Column(children: <Widget>[
          const SizedBox(height: 15),
      Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 100,
                height: 50,
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/teacher.png'),
                      fit: BoxFit.fill),
                ),
              ),
            ],
          )),
      const SizedBox(height: 10),
        Card(
          color: Colors.blueGrey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
              leading: Icon(Icons.list_alt_sharp),
              title: const Text(
                'internships list',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              }),
        ),
        const SizedBox(height: 10),
        Card(
          color: Colors.blueGrey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
              leading: Icon(Icons.add_circle_outline_sharp),
              title: const Text(
                'add new application',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, newApplicationScreen.routeName);
              }),
        ),
        const SizedBox(height:10 ),
        Card(
          color: Colors.blueGrey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
              leading: Icon(Icons.list_alt_sharp),
              title: const Text(
                'My applications',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, ApplicationScreen.routeName);
              }),
        ),
        SizedBox(height: 10),
        Card(
          color: Colors.blueGrey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'My marks',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // userLogout();
              // Authentication.signOut(context: context);
              Navigator.pushNamed(context, MarksScreen.routeName);
            },
          ),
        ),
              SizedBox(height: 10),
              Card(
                color: Colors.blueGrey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(
                    'My attendance',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    // userLogout();
                    // Authentication.signOut(context: context);
                    Navigator.pushNamed(context, AttendanceScreen.routeName);
                  },
                ),
              ),
        const SizedBox(height: 10),
              Card(
                color: Colors.blueGrey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(
                    'logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    // userLogout();
                    // Authentication.signOut(context: context);
                    Navigator.pushNamed(context, LoginPage.routeName);
                  },
                ),
              ),
              const SizedBox(height: 10),
   ] )));

  }

}
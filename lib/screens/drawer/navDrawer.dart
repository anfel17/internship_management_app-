import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/home/home_screen.dart';
import 'package:internship_management_system/screens/myApplications/myApplication_screen.dart';
import 'package:internship_management_system/screens/newApplication/newApplication.dart';
import 'package:internship_management_system/screens/marks/marks_screen.dart';
import 'package:internship_management_system/screens/myAttendance/attendance_screen.dart';
import 'package:internship_management_system/provider/user.dart';
import 'package:provider/provider.dart';
import '../login/login_screen.dart';
import '../../../constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}


class _NavDrawerState extends State<NavDrawer> {
  String userId = '';
  late UserProvider userProvider;
  String name = "";
  String email = "";


  Future<void> getStudentAccount(String userId) async {
    Uri url = Uri.parse(consultStudentAccount);
    var response = await http.post(url, body: {'id': userId});

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        name = data[0]['nom_etudiant'] + ' ' + data[0]['prenom_etudiant'];
        email = data[0]['email'];
      });
    } else {
      print("error");
    }
  }


  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userId = userProvider.userId;
    getStudentAccount(userId);
  }



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF276887),Colors.lightBlue[50]!, Color(0xFF276887)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,

              child: Container(
                width: 100,
                height: 150,
                margin: const EdgeInsets.only(
                  top: 30,
                  left: 15,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/graduate.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.home_filled),
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
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
              },
            ),
            const SizedBox(height: 10),
            ListTile(
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
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.article),
              title: Text(
                'My marks',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, MarksScreen.routeName);
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text(
                'My attendance',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, AttendanceScreen.routeName);
              },
            ),
        Container(
          // width: 100,
          // height: 300,
          margin: const EdgeInsets.only(
            top: 200,
            left: 150,
          ),
          child:
            Align(
              alignment: Alignment.bottomRight,


                child:ListTile(
                  leading: Text(
                    'logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  title: Icon(Icons.logout),
                  onTap: () {
                    Navigator.pushNamed(context, LoginPage.routeName);
                  },
                ),

            ),
        ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );




  }

}
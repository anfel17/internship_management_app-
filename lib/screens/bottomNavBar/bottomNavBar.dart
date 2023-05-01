import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/notifications/notification_screen.dart';
import 'package:internship_management_system/screens/myProfile/profile_screen.dart';
import 'package:internship_management_system/screens/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../constants.dart';
import 'package:internship_management_system/provider/user.dart';
import 'package:provider/provider.dart';


class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  String userId='';
  late UserProvider userProvider;
  int unseenStudentNotif=0;
  Future<void> getUnseenNotifCount(String userId) async {
    Uri url = Uri.parse(unseenStudentNotifNbr);
    var response = await http.post(url, body: {'id':userId});

    if (response.statusCode == 200) {
      setState(() {
        unseenStudentNotif = int.parse(response.body);
        print(unseenStudentNotif);
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
    getUnseenNotifCount(userId);
  }
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, NotificationsScreen.routeName);
                },
                child: Stack(
                  children: [
                    Icon(Icons.notifications),
                    if (unseenStudentNotif != 0)
                      Positioned(
                        right: -0.75,
                        top: -1,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth:11,
                            minHeight: 11,
                          ),
                          child: Text(
                            '$unseenStudentNotif',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              label: 'Notifications',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: (index) {
    setState(() {
    _selectedIndex = index;
    });
    if (index == 2) {
    Navigator.pushNamed(context, NotificationsScreen.routeName);
    } else if (index == 1) {
    Navigator.pushNamed(context, ProfileScreen.routeName);
    } else if (index == 0) {
    Navigator.pushNamed(context, HomeScreen.routeName);
    }
    },
          );

  }
}










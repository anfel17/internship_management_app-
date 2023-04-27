import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/notifications/notification_screen.dart';
import 'package:internship_management_system/screens/myProfile/profile_screen.dart';
import 'package:internship_management_system/screens/home/home_screen.dart';


class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          _onItemTapped(index);
          if (index == 2) {
            Navigator.pushNamed(context, NotificationsScreen.routeName);
          }else if (index == 1){
            Navigator.pushNamed(context, ProfileScreen.routeName);
          }else if (index == 0){
            Navigator.pushNamed(context, HomeScreen.routeName);
          }
          ;
        });
  }
}


import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/drawer/navDrawer.dart';
import 'package:internship_management_system/screens/notifications/notification_screen.dart';
import 'components/body.dart';

class PresenceScreen extends StatelessWidget {
  static String routeName = "/ApplicationScreen";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF3A96B4),
          actions: <Widget>[
            // Using Stack to show Notification Badge
            new Stack(
                children: <Widget>[
                  new IconButton(icon: Icon(Icons.notifications), onPressed: () {
                    Navigator.pushNamed(context, NotificationsScreen.routeName);

                  })]
            ),]),
      drawer: NavDrawer(),
      body: Body(),
    );
  }
}

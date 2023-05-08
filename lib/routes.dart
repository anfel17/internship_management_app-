import 'package:flutter/widgets.dart';
import 'package:internship_management_system/screens/home/home_screen.dart';
import 'package:internship_management_system/screens/myApplications/myApplication_screen.dart';
import 'package:internship_management_system/screens/notifications/notification_screen.dart';
import 'package:internship_management_system/screens/newApplication/newApplication.dart';
import 'package:internship_management_system/screens/myProfile/profile_screen.dart';
import 'package:internship_management_system/screens/updateProfile/update_profile_screen.dart';
import 'package:internship_management_system/screens/login/login_screen.dart';
import 'package:internship_management_system/screens/myApplications/applicationDetailsScreen.dart';
import 'package:internship_management_system/screens/marks/marks_screen.dart';
import 'package:internship_management_system/screens/myAttendance/attendance_screen.dart';


final Map<String, WidgetBuilder> routes = {
   HomeScreen.routeName: (context) => HomeScreen(),
   ApplicationScreen.routeName: (context) => ApplicationScreen(),
   NotificationsScreen.routeName: (context) => NotificationsScreen(),
   newApplicationScreen.routeName: (context) => newApplicationScreen(),
   ProfileScreen.routeName: (context) => ProfileScreen(),
   UpdateProfileScreen.routeName: (context) => UpdateProfileScreen(),
   LoginPage.routeName: (context) => LoginPage(),
   MarksScreen.routeName: (context) => MarksScreen(),
   AttendanceScreen.routeName: (context) => AttendanceScreen(),
  // applicationDetailsScreen.routeName: (context) => applicationDetailsScreen(data: data),

};
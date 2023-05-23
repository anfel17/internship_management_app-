import 'package:flutter/material.dart';
import 'package:internship_management_system/routes.dart';
import 'package:internship_management_system/screens/login/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:internship_management_system/provider/user.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}




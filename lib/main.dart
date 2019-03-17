import 'package:flutter/material.dart';

import 'pages/dashboard.dart';
import 'pages/login_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';
import 'pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: {
          "/login": (context) => LoginPage(),
          "/dashboard": (context) => Dashboard(),
          "/settings": (context) => SettingsPage(),
          "/profile": (context) => ProfilePage()
        },
        home: SplashPage());
  }
}

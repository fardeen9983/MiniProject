import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'login_page.dart';
import 'dashboard.dart';
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final auth = FirebaseAuth.instance;
  bool loggedin = false;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() {
          this.prefs = prefs;
          loggedin = prefs.getBool("loggedin");
          if (loggedin == null)
            loggedin = false;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      loadingText: Text(
        "Loading", style: TextStyle(fontSize: 24.0, color: Colors.white),),
      image: Image.asset("assets/logo.png"),
      photoSize: 200.0,
      title: Text(
        "ROOM MONITOR", style: TextStyle(fontSize: 32.0, color: Colors.white),),
      loaderColor: Colors.white,
      backgroundColor: Colors.blue,
      navigateAfterSeconds: loggedin ? Dashboard() : LoginPage(),
    );
  }
}

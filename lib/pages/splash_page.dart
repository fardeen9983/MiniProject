import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences.getInstance().then((data) {
      this.prefs = data;
      loggedin = data.get("loggedin");
    });
  }

  @override
  Widget build(BuildContext context) {
    return loggedin ? {
    Navigator.pushReplacementNamed(context, "/login")
    } : Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(34, 52, 255, 100), Color.fromRGBO(89, 53, 255, 100)])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 38.0, right: 18.0, left: 18.0, bottom: 28.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Appliance Management",
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Project Description",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, "/login"),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8.0),
                    child: Text("Get Started"),
                  ),
                )),
          )
        ],
      ),
    );
  }
}



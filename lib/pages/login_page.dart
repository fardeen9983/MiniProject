import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mailController, passwordController;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  FirebaseAuth firebaseAuth;
  String password, mail;
  SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    mailController = TextEditingController();
    passwordController = TextEditingController();
    firebaseAuth = FirebaseAuth.instance;
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() {
          this.prefs = prefs;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: key,
      body: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(vertical: 58.0),
                child: Image(
                  image: AssetImage("assets/logo.png"),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)),
              padding: EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: mailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: passwordController,
                      style: TextStyle(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text(
                            "Create account",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          onPressed: null,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () {
                password = passwordController.text;
                mail = mailController.text;
                if (password.isEmpty || mail.isEmpty) {
                  key.currentState.showSnackBar(
                      SnackBar(content: Text("Please enter all credentials")));
                } else {
                  signIn(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38.0, vertical: 8.0),
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn(BuildContext context) {
    firebaseAuth
        .signInWithEmailAndPassword(email: mail, password: password)
        .then((user) {
      prefs.setBool("loggedin", true);
      prefs.setString("uid", user.uid);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
    }).catchError((e) =>
        key.currentState.showSnackBar(SnackBar(
            content: Text("Error : Unable to sign in try again"))));
  }
}

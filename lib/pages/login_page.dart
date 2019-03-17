import 'package:flutter/material.dart';

import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mail, password;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    mail = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Color.fromARGB(32, 23, 344, 100),
          Color.fromARGB(88, 23, 344, 100)
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Spacer(),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: mail,
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
                        controller: password,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: null,
                            child: Text("Forgot Password"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            child: Text("Create account"),
                            onPressed: null,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: FlatButton(
                onPressed: () {
                  String password = this.password.text;
                  String mail = this.mail.text;
                  if (password.isEmpty || mail.isEmpty) {
                    key.currentState.showSnackBar(SnackBar(
                        content: Text("Please enter all credentials")));
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  }
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8.0),
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 18.0),
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
    mail.dispose();
    password.dispose();
    super.dispose();
  }

  void signIn(BuildContext context) {}
}

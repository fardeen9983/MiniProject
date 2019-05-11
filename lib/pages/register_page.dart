import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  TextEditingController email, name, deviceId, password;
  FirebaseAuth firebaseAuth;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    name = TextEditingController();
    deviceId = TextEditingController();
    password = TextEditingController();

    firebaseAuth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Container(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back,
                              size: 28.0,
                            )),
                        Text(
                          "Register",
                          style: TextStyle(fontSize: 22.0),
                        ),
                        Text("   ", style: TextStyle(fontSize: 22.0))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                  left: 8.0,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Container(
                      padding: const EdgeInsets.only(
                          bottom: 12.0, left: 8.0, right: 8.0, top: 8.0),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "Enter details",
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: name,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: "Name",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: password,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0))),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    firebaseAuth
                                        .createUserWithEmailAndPassword(
                                        email: email.text,
                                        password: password.text)
                                        .then((user) {
                                      UserUpdateInfo profile = UserUpdateInfo();
                                      profile.displayName = name.text;
                                      profile.photoUrl = "";
                                      user.updateProfile(profile);
                                      key.currentState.showSnackBar(SnackBar(
                                          content: Text(
                                              "User created successfully")));
                                      Navigator.of(context).pop();
                                    }).catchError((err) =>
                                        key.currentState
                                            .showSnackBar(SnackBar(
                                            content:
                                            Text("Error : " + err))));
                                  },
                                  child: Container(
                                      child: Text(
                                        "Done",
                                        style: TextStyle(fontSize: 22.0),
                                      ))),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(fontSize: 22.0),
                                      )))
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

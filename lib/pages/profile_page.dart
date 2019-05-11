import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final key = GlobalKey<ScaffoldState>();
  bool editable, load;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    editable = false;
    load = false;
    FirebaseAuth.instance.currentUser().then((user) {
      this.user = user;
      setState(() {
        load = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                          "Profile",
                          style: TextStyle(fontSize: 22.0),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                editable = !editable;
                              });
                            },
                            child: Icon(
                              Icons.edit,
                              size: 28.0,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              user == null
                  ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )
                    ],
                  ))
                  : Padding(
                padding: const EdgeInsets.only(),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 58.0),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 8.0),
                          child: Icon(
                            Icons.account_circle,
                            size: 100.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 24.0),
                          child: Text(user.displayName,
                            style: TextStyle(fontSize: 28.0),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 24.0),
                          child: Text(
                            user.email, style: TextStyle(fontSize: 22.0),),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisableFocus extends FocusNode {
  @override
  bool get hasFocus => false;
}

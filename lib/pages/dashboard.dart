import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final firebaseAuth = FirebaseAuth.instance;
  FirebaseUser user;
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    firebaseAuth.currentUser().then((user) {
      setState(() {
        this.user = user;
        loaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return !loaded ? CircularProgressIndicator() : Scaffold(
      key: key,
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0, bottom: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.account_circle,
                            size: 52.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: Text(
                            this.user.displayName == null ? "Unnamed" : this
                                .user.displayName,
                            style: TextStyle(fontSize: 26.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/profile"),
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      size: 32.0,
                    ),
                    title: Text(
                      "Profile",
                      style: TextStyle(fontSize: 18.0,),
                    ),
                  )),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/blocks"),
                child: ListTile(
                  leading: Icon(Icons.home, size: 32.0),
                  title: Text(
                    "Blocks",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/notification"),
                child: ListTile(
                  leading: Icon(Icons.notifications, size: 32.0),
                  title: Text(
                    "Notification",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/about"),
                child: ListTile(
                  leading: Icon(Icons.info, size: 32.0),
                  title: Text(
                    "About Us",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  SharedPreferences.getInstance().then((data) {
                    data.setBool("loggedin", false);
                    Navigator.popAndPushNamed(context, "/login");
                  });
                },
                child: ListTile(
                  leading: Icon(Icons.dashboard, size: 32.0),
                  title: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
                            onTap: () => key.currentState.openDrawer(),
                            child: Icon(
                              Icons.menu,
                              size: 28.0,
                            )),
                        Text(
                          "Dashboard",
                          style: TextStyle(fontSize: 22.0),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/settings");
                            }, child: Icon(
                              Icons.settings,
                              size: 28.0,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

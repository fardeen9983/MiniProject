import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../layouts/dashboard_tile.dart';
import '../layouts/room_tile.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final firebaseAuth = FirebaseAuth.instance;
  FirebaseUser user;
  bool loaded = false;
  List<Room> rooms;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    rooms = List();
    SharedPreferences.getInstance().then((prefs) {
      this.prefs = prefs;
      firebaseAuth.currentUser().then((user) {
        setState(() {
          this.user = user;
          loaded = true;
          fetchRooms(user.uid);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return !loaded
        ? CircularProgressIndicator()
        : Scaffold(
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
                            this.user.displayName == null
                                ? "Unnamed"
                                : this.user.displayName,
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
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  )),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/rooms"),
                child: ListTile(
                  leading: Icon(Icons.home, size: 32.0),
                  title: Text(
                    "Rooms",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  prefs.setBool("loggedin", false);
                  firebaseAuth.signOut();
                  Navigator.pushReplacementNamed(context, "/login");
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
                        Text("  ", style: TextStyle(fontSize: 22.0),)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    left: 8.0,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                        padding: const EdgeInsets.only(
                            bottom: 12.0,
                            left: 8.0,
                            right: 8.0,
                            top: 8.0),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(8.0),
                                  color:
                                  Color.fromRGBO(255, 107, 117, 100)),
                              alignment: Alignment.center,
                              child: Text(
                                "Total Power",
                                style: TextStyle(fontSize: 24.0),
                              ),
                              padding: EdgeInsets.all(12.0),
                            ),
                            rooms.isEmpty
                                ? Padding(
                                padding: EdgeInsets.all(18.0),
                                child: CircularProgressIndicator())
                                : Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                                  itemCount: rooms.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) =>
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: DashboardTile(
                                          room: rooms[index],
                                        ),
                                      ),
                                )),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchRooms(String uid) async {
    var response = await http.get(
        "http://13.234.156.214/web1/application/getRoomsByUser.php?USER_ID=test");
    List<dynamic> x = json.decode(response.body);
    for (dynamic y in x) {
      Room room = await Room.fromUser(y);
      rooms.add(room);
    }
    setState(() {});
  }
}

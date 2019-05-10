import 'package:flutter/material.dart';
import 'dart:async';
import '../layouts/room_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RoomPage extends StatefulWidget {
  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final key = GlobalKey<ScaffoldState>();
  List<Room> rooms = List();
  Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (t) => fetchRooms());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void fetchRooms() async {
    var response = await http.get(
        "http://13.234.156.214/web1/application/getRoomsByUser.php?USER_ID=test");
    List<dynamic> x = json.decode(response.body);
    rooms.clear();
    for (dynamic y in x) {
      //  Map<String, dynamic> map = x[0];
      Room room = await Room.fromJson(y);
      rooms.add(room);
    }
//    Map<String, dynamic> map = x[0];
//    rooms.clear();
//    rooms.add(Room.fromJson(map));
    setState(() {});
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
                          "Rooms",
                          style: TextStyle(fontSize: 22.0),
                        ),
                        Text(" ")
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 12.0, left: 8.0, right: 8.0, top: 8.0),
                          child: rooms.isEmpty
                              ? Padding(
                            padding: EdgeInsets.all(30.0),
                            child: CircularProgressIndicator(),
                          )
                              : ListView.builder(
                            itemCount: rooms.length,
                            itemBuilder: (context, index) =>
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(8.0)),
                                  child: rooms[index],
                                  elevation: 3.0,
                                ),
                          ),
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
}

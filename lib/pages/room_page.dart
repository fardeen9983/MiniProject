import 'package:flutter/material.dart';

import '../layouts/room_tile.dart';

class RoomPage extends StatefulWidget {
  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final key = GlobalKey<ScaffoldState>();
  List<Room> rooms = List();

  @override
  void initState() {
    super.initState();
    rooms.add(Room(
      no: "A201",
      type: "LAB",
      current: 1.0,
    ));
    rooms.add(Room(
      no: "A201",
      type: "LAB",
      current: 1.0,
    ));
    rooms.add(Room(
      no: "A201",
      type: "LAB",
      current: 1.0,
    ));
    rooms.add(Room(
      no: "A201",
      type: "LAB",
      current: 1.0,
    ));
    rooms.add(Room(
      no: "A201",
      type: "LAB",
      current: 1.0,
    ));
    rooms.add(Room(
      no: "A201",
      type: "LAB",
      current: 1.0,
    ));
    rooms.add(Room(
      no: "A201",
      type: "LAB",
      current: 1.0,
    ));
    rooms.add(Room(
      no: "A201",
      type: "LAB",
      current: 1.0,
    ));
    rooms.add(Room(
      no: "A203",
      type: "LAB",
      current: 1.0,
    ));
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
                          child: ListView.builder(
                              itemCount: rooms.length,
                              itemBuilder: (context, index) => rooms[index]),
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

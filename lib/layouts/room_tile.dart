import 'package:flutter/material.dart';
import '../pages/history_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:date_format/date_format.dart';

class Room extends StatelessWidget {
  final String name, id;
  final String current;
  final int state;
  final Widget imageIcon;
  final bool switch1;
  double yesterday, monthly;

  Room({Key key,
    @required this.name,
    @required this.current,
    @required this.state,
    @required this.id,
    this.imageIcon,
    @required this.switch1})
      : super(key: key);

  static Future<Room> fromUser(Map<String, dynamic> map) async {
    Room room = Room(
      name: map["ROOM_NAME"],
      current: null,
      state: null,
      id: map["ROOM_ID"],
      switch1: map["SWITCH"] == 0 ? false : true,
    );
    DateTime now = DateTime.now();
    DateTime prev = DateTime(now.year, now.month, now.day - 1);
    String day = formatDate(prev, [yyyy, "-", mm, "-", dd]);
    var response = await http.get(
        "http://13.234.156.214/web1/application/getRoomDailyPowerByDate.php?ROOM_ID=${room
            .id}&DATE=$day");
    print(response.body);
    print(day);
    if ((json.decode(response.body) as List<dynamic>).isNotEmpty)
      room.yesterday = double.parse((json.decode(response.body)
      as List<dynamic>)[0]["TOTAL_POWER_CONSUMED"]);
    else
      room.yesterday = -1;

    response = await http.get(
        "http://13.234.156.214/web1/application/getMonthlyPowerByMonth.php?ROOM_ID=${room
            .id}&YEAR=${now.year}&MONTH=${now.month - 1}");
    if ((json.decode(response.body) as List<dynamic>).isNotEmpty)
      room.monthly = double.parse(
          (json.decode(response.body) as List<dynamic>)[0]["TOTAL_POWER"]);
    else
      room.monthly = -1;
    return room;
  }

  static Room fromJson(Map<String, dynamic> map) {
    print(map);
    var switch1 = double.parse(map["CURRENT_DRAW"]),
        presence = int.parse(map["PRESENCE"]);
    var state = getState(switch1, presence);
    return Room(
      switch1: map["SWITCH"] == 1 ? true : false,
      id: map["ROOM_ID"],
      name: map["ROOM_NAME"],
      current: map["CURRENT_DRAW"],
      state: state,
      imageIcon: fetchImage(state),
    );
  }

  static Widget fetchImage(int state) {
    switch (state) {
      case 1:
        return Image.asset(
          "assets/green_ok.png",
        );
      case 0:
        return Image.asset("assets/error.png");
      case -1:
        return Image.asset("assets/warning.png");
      default:
        return Image.asset("assets/green_ok.png");
    }
  }

  static int getState(double x, int y) {
    if ((x > 0.6 && y == 1))
      return 1;
    else if (x > 0.6 && y == 0)
      return -1;
    else
      return 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HistoryPage(
                        room: this,
                      ))),
      child: Container(
        child: Builder(
            builder: (context) =>
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(12.0),
                              margin: EdgeInsets.all(
                                8.0,
                              ),
                              child: Text(
                                name,
                                style: TextStyle(fontSize: 24.0),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      height: 70.0,
                      width: 1.0,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "$current Amp",
                              style: TextStyle(fontSize: 24.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Current Draw",
                              style: TextStyle(fontSize: 24.0),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    Center(
                      child: imageIcon,
                    )
                  ],
                )),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

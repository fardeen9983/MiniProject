import 'package:flutter/material.dart';
import '../layouts/room_tile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  final Room room;

  const HistoryPage({Key key, @required this.room}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

enum HistoryChoice { daily, monthly }

class _HistoryPageState extends State<HistoryPage> {
  @override
  Text auto = Text(
    "Auto",
    style: TextStyle(fontSize: 22.0, color: Colors.white),
  ),
      on = Text(
        "ON",
        style: TextStyle(fontSize: 22.0, color: Colors.white),
      ),
      daily = Text(
        "Daily",
        style: TextStyle(fontSize: 22.0, color: Colors.white),
      ),
      monthly = Text(
        "Monthly",
        style: TextStyle(fontSize: 22.0, color: Colors.white),
      );

  bool autoBool;
  SharedPreferences prefs;
  HistoryChoice state = HistoryChoice.daily;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) => this.prefs = prefs);
    autoBool = widget.room.switch1;

    print(autoBool);
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
                          widget.room.name,
                          style: TextStyle(fontSize: 22.0),
                        ),
                        Text(" ")
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        auto,
                        Switch(
                          value: autoBool,
                          onChanged: onAutoToMan,
                          activeColor: Colors.green,
                        ),
                        on,
                        Switch(
                          value: autoBool,
                          onChanged: onOff,
                          activeColor: Colors.green,
                          inactiveTrackColor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        daily,
                        Radio(
                            activeColor: Colors.white,
                            value: HistoryChoice.daily,
                            groupValue: state,
                            onChanged: controlHistory),
                        monthly,
                        Radio(
                            activeColor: Colors.white,

                            value: HistoryChoice.monthly,
                            groupValue: state,
                            onChanged: controlHistory),
                      ],
                    ),
                  ),
                ],
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
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: null,
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

  void onAutoToMan(bool state) async {
    autoBool = state;
    var response;
    if (autoBool == false)
      response = await http.get(
          "http://13.234.156.214/web1/application/setSwitch.php?ROOM_ID=${widget
              .room.id}&SWITCH=0");
    else
      response = await http.get(
          "http://13.234.156.214/web1/application/setSwitch.php?ROOM_ID=${widget
              .room.id}&SWITCH=1");
  }

  void onOff(bool state) async {
    if (!autoBool) {
      var response;
      if (state)
        response = await http.get(
            "http://13.234.156.214/web1/application/setSwitch.php?ROOM_ID=${widget
                .room.id}&SWITCH=1");
      else
        response = await http.get(
            "http://13.234.156.214/web1/application/setSwitch.php?ROOM_ID=${widget
                .room.id}&SWITCH=0");
    }
  }

  void controlHistory(HistoryChoice state) {
    if (!autoBool) {
      this.state = state;
    }
  }
}

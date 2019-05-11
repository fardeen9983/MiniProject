import "dart:convert";

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../layouts/room_tile.dart';

class HistoryPage extends StatefulWidget {
  final Room room;

  const HistoryPage({Key key, @required this.room}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

enum HistoryChoice { daily, monthly }

class _HistoryPageState extends State<HistoryPage> {
  Text auto = Text(
    "Auto",
    style: TextStyle(fontSize: 20.0, color: Colors.white),
  ),
      on = Text(
        "ON",
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
      daily = Text(
        "Daily",
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
      monthly = Text(
        "Monthly",
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      );

  bool autoBool, autoBool2, loadHistory;
  Widget dailyHistory, monthlyHistory;
  HistoryChoice state = HistoryChoice.daily;
  Widget historyView = Container();

  @override
  void initState() {
    super.initState();
    loadHistory = false;
    autoBool = widget.room.auto;
    autoBool2 = widget.room.switch1;
//   autoBool = false;
//   autoBool2 = false;
    if (autoBool == null) autoBool = false;
    if (autoBool2 == null) autoBool2 = false;
//    print(autoBool);
//    print(autoBool2);
    fetchHistory().then((val) =>
        this.setState(() {
          loadHistory = val;
          if (loadHistory) historyView = dailyHistory;
        }));
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
                        Checkbox(
                          value: autoBool,
                          onChanged: (bool value) {
                            onAutoToMan(value);
                          },
                          activeColor: Colors.green,
                          //  checkColor: Colors.blue,
                        ),
                        on,
                        Checkbox(
                          value: autoBool2,
                          onChanged: (value) {
                            onOff(value);
                          },
                          activeColor: Colors.green,
                          //  inactiveTrackColor: Colors.grey,
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
              loadHistory
                  ? Expanded(
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
                        padding: EdgeInsets.all(22.0),
                        child: historyView,
                      ),
                    ),
                  ),
                ),
              )
                  : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  var x = "pattern: ";

  void onAutoToMan(bool value) async {
    setState(() {
      autoBool = value;
    });
    autoBool = value;
    if (autoBool)
      debugPrint("pattern True");
    else
      debugPrint("pattern False");
    var response;
    if (autoBool == false) {
      x = "http://13.234.156.214/web1/application/setSwitch.php?ROOM_ID=${widget
          .room.id}&SWITCH=0";
      response = await http.get(x);
      //  prefs.setBool('autoBool'+widget.room.id, false);
    } else {
      x = "http://13.234.156.214/web1/application/setSwitch.php?ROOM_ID=${widget
          .room.id}&SWITCH=-1";
      setState(() {
        autoBool2 = false;
      });
      response = await http.get(x);
      print(response);
      //  prefs.setBool('autoBool'+widget.room.id, true);

    }
    debugPrint("pattern " + x);
  }

  void onOff(bool state) async {
    autoBool2 = state;
    setState(() {
      autoBool2 = state;
      autoBool = false;
    });
    // if (!autoBool) {
    var response;
    if (state) {
      x = "http://13.234.156.214/web1/application/setSwitch.php?ROOM_ID=${widget
          .room.id}&SWITCH=1";
      response = await http.get(x);
      //     prefs.setBool('autoBool2'+widget.room.id, true);
    } else
      x = "http://13.234.156.214/web1/application/setSwitch.php?ROOM_ID=${widget
          .room.id}&SWITCH=0";
    response = await http.get(x);
    //  prefs.setBool('autoBool2'+widget.room.id, false);
    // }
    debugPrint(x);
  }

  void controlHistory(HistoryChoice state) {
    if (!autoBool) {
      this.state = state;
    }
    switch (state) {
      case HistoryChoice.daily:
        historyView = dailyHistory;
        break;
      case HistoryChoice.monthly:
        historyView = monthlyHistory;
        break;
    }
    setState(() {});
  }

  Future<bool> fetchHistory() async {
    var daily = await http.get(
        "http://13.234.156.214/web1/application/getRoomDailyPower.php?ROOM_ID=${widget
            .room.id}");
    var monthly = await http.get(
        "http://13.234.156.214/web1/application/getRoomMonthlyPower.php?ROOM_ID=${widget
            .room.id}");
    List<dynamic> dailyResponse = json.decode(daily.body);
    List<dynamic> monthlyResponse = json.decode(monthly.body);
    dailyHistory = ListView.builder(
      itemBuilder: (context, index) =>
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    dailyResponse[index]["DATE"],
                    style: TextStyle(fontSize: 22.0),
                  ),
                  Text(
                    dailyResponse[index]["TOTAL_POWER_CONSUMED"] + " W",
                    style: TextStyle(fontSize: 22.0),
                  )
                ],
              ),
            ),
          ),
      itemCount: dailyResponse.length,
    );
    monthlyHistory = ListView.builder(
      itemBuilder: (context, index) =>
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      getMonth(int.parse(monthlyResponse[index]["MONTH"])) +
                          " " +
                          monthlyResponse[index]["YEAR"],
                      style: TextStyle(fontSize: 22.0),
                    ),
                    Text(
                      monthlyResponse[index]["TOTAL_POWER"] + " W",
                      style: TextStyle(fontSize: 22.0),
                    )
                  ],
                ),
              ),
            ),
          ),
      itemCount: monthlyResponse.length,
    );
    return true;
  }

  String getMonth(int x) {
    switch (x) {
      case 1:
        return "JAN";
      case 2:
        return "FEB";
      case 3:
        return "MAR";
      case 4:
        return "APR";
      case 5:
        return "MAY";
      case 6:
        return "JUN";
      case 7:
        return "JUL";
      case 8:
        return "AUG";
      case 9:
        return "SEP";
      case 10:
        return "OCT";
      case 11:
        return "NOV";
      case 12:
        return "DEC";
      default:
        return "JAN";
    }
  }
}

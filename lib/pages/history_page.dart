import 'package:flutter/material.dart';
import '../layouts/room_tile.dart';
import 'package:http/http.dart' as http;

class HistoryPage extends StatefulWidget {
  final Room room;

  const HistoryPage({Key key, this.room}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Text auto = Text("Auto"),
      man = Text("Manual"),
      off = Text("off"),
      on = Text("ON"),
      autoState,
      onState;
  bool autoBool;

  @override
  void initState() {
    super.initState();
    autoBool = widget.room.switch1;
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  autoState,
                  Switch(
                    value: false,
                    onChanged: onAutoToMan,
                    activeColor: Colors.green,
                  ),
                  Spacer(),
                  onState,
                  Switch(
                    value: false,
                    onChanged: onAutoToMan,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
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

  void onAutoToMan(bool state) {}
}

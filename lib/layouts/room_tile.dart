import 'package:flutter/material.dart';
import '../pages/history_page.dart';

class Room extends StatelessWidget {
  final String name, id;
  final String current;
  final int state;
  final Widget imageIcon;
  final bool switch1;

  const Room({Key key,
    @required this.name,
    @required this.current,
    @required this.state,
    @required this.id,
    this.imageIcon, @required this.switch1})
      : super(key: key);

  static Room fromJson(Map<String, dynamic> map) {
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
    if ((x > 0.3 && y == 1))
      return 1;
    else if (x > 0.3 && y == 0)
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

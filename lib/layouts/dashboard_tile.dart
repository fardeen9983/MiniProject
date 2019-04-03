import 'package:flutter/material.dart';
import 'room_tile.dart';

class DashboardTile extends StatelessWidget {
  final Room room;

  const DashboardTile({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.blue)),
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "A203",
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.blue,),
                              right: BorderSide(color: Colors.blue,))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Yesterday"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "32 W",
                              style:
                              TextStyle(fontSize: 24.0, color: Colors.green),
                            ),
                          )
                        ],
                      ),
                    ), Container(
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.blue,))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Previous Month"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "32 W",
                              style:
                              TextStyle(fontSize: 24.0, color: Colors.green),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }


}

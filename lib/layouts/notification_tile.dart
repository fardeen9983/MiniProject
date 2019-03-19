import 'package:flutter/material.dart';

class Notify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 12.0,
          left: 8.0,
          right: 8.0, top: 8.0
      ),
      child: Container(
        child: Builder(builder: (context) =>
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 18.0),
                  child: Container(
                      child: Center(
                          child: Text("A", style: TextStyle(fontSize: 48.0),)
                      )
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Alert", style: TextStyle(fontSize: 22.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text("11:30"),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Active Rooms : 30"),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  ),
                ),

              ],
            ),),
        decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      ),
    );
  }
}

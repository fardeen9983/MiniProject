import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(
        builder: (context) =>
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    child: Center(
                        child: Text(
                          "A",
                          style: TextStyle(fontSize: 48.0),
                        ))),
                Container(
                  width: 1.0,
                  height: 42.0,
                  color: Colors.black,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Total Rooms : 40",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Active Rooms : 30"),
                      ),
                    ],

                  ),
                ),
              ],
            ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(5.0),
    );
  }
}

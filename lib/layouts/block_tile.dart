import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 12.0, left: 8.0, right: 8.0, top: 8.0),
      child: Container(
        child: Builder(
          builder: (context) => Row(
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
                    child: Padding(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                  ),
                ],
              ),
        ),
        decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      ),
    );
  }
}

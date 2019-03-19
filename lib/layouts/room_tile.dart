import 'package:flutter/material.dart';

class Room extends StatelessWidget {
  final String type, no;
  final double current;
  final int state;

  const Room({Key key,
    @required this.type,
    @required this.no,
    @required this.current,
    this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 12.0,
          left: 8.0,
          right: 8.0, top: 8.0
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(type),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(no),
                  ),
                ],
              ),
            ),
            Container(
              width: 1.0,
              height: 12.0,
              color: Colors.black,
              margin: EdgeInsets.symmetric(vertical: 10.0),
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
                    child: Text("Current Draw"),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            Container(
              child: Center(
                child: CircleAvatar(
                  child: Icon(
                    Icons.account_circle,
                    size: 24.0,
                  ),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      ),
    );
  }
}

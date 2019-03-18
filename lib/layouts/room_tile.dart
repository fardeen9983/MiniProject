import 'package:flutter/material.dart';

class Room extends StatelessWidget {
  final String type, no;
  final double current;
  final int state;

  const Room({Key key, this.type, this.no, this.current, this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
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
          Column(
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
    );
  }
}

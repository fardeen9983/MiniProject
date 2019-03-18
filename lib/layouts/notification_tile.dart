import 'package:flutter/material.dart';

class Notify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text("fdsfd"),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[Text("Alert"), Text("fdsfdsf")],
            ),
          )
        ],
      ),
    );
  }
}

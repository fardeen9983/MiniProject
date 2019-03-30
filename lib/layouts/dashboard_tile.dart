import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.blue)),
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "A203",
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 38.0, right: 18.0, left: 18.0, bottom: 28.0),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Appliance Management",
                      style: TextStyle(fontSize: 28.0, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Project Description",
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: FlatButton(
                onPressed: () =>
                    Navigator.of(context).popAndPushNamed("/login"),
                child: Card(
                  color: Colors.white,
                  child: Text("Get Started"),
                )),
          )
        ],
      ),
    );
  }
}

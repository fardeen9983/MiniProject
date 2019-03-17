import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(34, 52, 255, 100), Color.fromRGBO(89, 53, 255, 100)])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 38.0, right: 18.0, left: 18.0, bottom: 28.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Appliance Management",
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
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
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, "/login"),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8.0),
                    child: Text("Get Started"),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

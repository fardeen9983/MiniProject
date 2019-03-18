import 'package:flutter/material.dart';
import '../layouts/notification_tile.dart';
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final key = GlobalKey<ScaffoldState>();
  List<Notify> notifications = List();


  @override
  void initState() {
    super.initState();
    notifications.add(Notify());
    notifications.add(Notify());
    notifications.add(Notify());
    notifications.add(Notify());
    notifications.add(Notify());
    notifications.add(Notify());
    notifications.add(Notify());
    notifications.add(Notify());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      floatingActionButton: FloatingActionButton(
        onPressed: null, child: Icon(Icons.add),),
      body: Container(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back,
                              size: 28.0,
                            )),
                        Text(
                          "Notifications",
                          style: TextStyle(fontSize: 22.0),
                        ),
                        Text("   ", style: TextStyle(fontSize: 22.0))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    left: 8.0,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 12.0, left: 8.0, right: 8.0, top: 8.0),
                          child: ListView.builder(
                              itemCount: notifications.length,
                              itemBuilder: (context,
                                  index) => notifications[index]),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

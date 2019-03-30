import 'package:flutter/material.dart';
import '../layouts/block_tile.dart';

class BlockPage extends StatefulWidget {
  @override
  _BlockPageState createState() => _BlockPageState();
}

class _BlockPageState extends State<BlockPage> {
  final key = GlobalKey<ScaffoldState>();
  List<Block> blocks = List();

  @override
  void initState() {
    super.initState();
    blocks.add(Block());
    blocks.add(Block());
    blocks.add(Block());
    blocks.add(Block());
    blocks.add(Block());
    blocks.add(Block());
    blocks.add(Block());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
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
                          "Blocks",
                          style: TextStyle(fontSize: 22.0),
                        ),
                        Text(" ")
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.95,
                    padding: const EdgeInsets.only(
                        bottom: 12.0, left: 8.0, right: 8.0, top: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 14.0),
                          itemCount: blocks.length,
                          itemBuilder: (context, index) =>
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0),
                                  child: Card(
                                      elevation: 3.0, child: blocks[index]),
                                ),
                                onTap: () =>
                                    Navigator.pushNamed(context, "/rooms"),
                              )),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final List list;
  final int index;
  Detail({this.index, this.list});

  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.list[widget.index]['item_name']}"),
      ),
      body: new Container(
        height: 250.0,
        padding: EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: [
                new Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['item_name'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  "code : ${widget.list[widget.index]['item_name']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "price : ${widget.list[widget.index]['item_name']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "stock : ${widget.list[widget.index]['item_name']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new RaisedButton(
                      onPressed: () {},
                      child: new Text("edit"),
                      color: Colors.green,
                    ),
                    new RaisedButton(
                      onPressed: () {},
                      child: new Text("delete"),
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Summary1 extends StatelessWidget {
  final int score;
  Summary1({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: Center(
          child: new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "App crashed",
                  style: new TextStyle(fontSize: 35.0),
                ),
                new Padding(padding: EdgeInsets.all(30.0)),
                new MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text(
                    "Exit",
                    style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

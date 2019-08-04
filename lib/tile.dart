import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String val;
  final Function onClick;

  Tile({this.val, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: RaisedButton(
        onPressed: this.onClick,
        child: Container(
          child: Center(
            child: Text(
              "$val",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          width: 80.0,
          height: 100.0,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  final String val;
  final Function onClick;

  Tile({this.val, this.onClick});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
    ..addListener((){
      setState((){});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _controller.forward();

    return Container(
      margin: EdgeInsets.all(5.0),
      child: RaisedButton(
        onPressed: () {
          widget.onClick();
          _controller.forward(from: 0.0);
        },
        child: Container(
          child: Center(
            child: FadeTransition(
              opacity: _animation,
              child: Text(
                "${widget.val}",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          width: 80.0,
          height: 100.0,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PlankWidget extends StatefulWidget {
  @override
  _PlankWidgetState createState() => _PlankWidgetState();
}

class _PlankWidgetState extends State<PlankWidget> {
  // double _xPlankVerticalPosition = 10.0;
  // double _yPlankVerticalPosition = 2.0;

  // void _MovePlank() {
  // setState(() {
  //  _yPlankVerticalPosition++;
  //  });
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      // Black square centered in stack
      new Align(
          alignment: new Alignment(0.0, -0.1),
          child: new Container(
            height: 500.0,
            width: 200.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/plank.png'),
                ),
              ),
            ),
          ))
    ]));
  }
}

import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final Color _color;
  final String _message;

  Welcome(this._color, this._message);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _color,
      ),
      height: 105.0,
      alignment: Alignment.center,

      child: Text('$_message',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.deepOrange,
            //fontWeight: FontWeight.w900,
            fontFamily: 'Roboto',
            fontSize: 25,
            letterSpacing: -0.5,
          )),
      //alignment: Alignment.topCenter,
    );
  }
}

class TextSection extends StatelessWidget {
  final Color _color;
  final String _message;

  TextSection(this._color, this._message);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _color,
      ),
      alignment: Alignment.center,
      height: 60.0,

      child: Text('$_message',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.deepOrange,
            //fontWeight: FontWeight.w900,
            fontFamily: 'Roboto',
            fontSize: 20,
            letterSpacing: -0.5,
          )),
      //alignment: Alignment.topCenter,
    );
  }
}

class TextBreak extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      height: 10.0,
      alignment: Alignment.center,

      //alignment: Alignment.topCenter,
    );
  }
}


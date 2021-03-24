import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class ChangeCovidMessage extends StatefulWidget {
  @override
  _ChangeCovidMessageState createState() => _ChangeCovidMessageState();
}

// state class
// We will replace this class in each of the examples below
class _ChangeCovidMessageState extends State<ChangeCovidMessage> {
  // state variable
  String _textString = ' ';
  String _sendResult = ' ';

  void _changeMessage(_textString) {
    http.get(
        'http://3.140.179.89:5000/change-msg?message_type=Covid&message=$_textString');
        _sendResult = '''
        Covid message has been changed.
         
        $_textString
        ''';
  }

  // The State class must include this method, which builds the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[900],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        
        title: Align( child: Text('Administration'),
        alignment: Alignment.centerRight,
      )),
        body: Column(
      children: [
        Text(
          'Change Covid Information',
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        TextField(
          onChanged: (text) {
            _doSomething(text);
          },
        ),
        RaisedButton(
          //                         <--- Button
          child: Text('Submit Changes'),
          onPressed: () {
            _sendMessage();
          },
        ),
        Text(_sendResult,
        textAlign: TextAlign.center,),
        TextButton(
            child: Container(
                alignment: Alignment.center,
                width: 1000,
                child: Text('Return To Admin',
                textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueAccent[500],
                      
                    ))),
            onPressed: () => {Navigator.pop(context)}),
      ],
    ));
  }

  // this private method is run whenever the button is pressed
  void _doSomething(String text) {
    // Using the callback State.setState() is the only way to get the build
    // method to rerun with the updated state value.
    setState(() {
      _textString = text;
    });
  }

  void _sendMessage() {
    setState(() {
      _changeMessage(_textString);
    });
  }
}

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:phfcc_sms/screens/home.dart';

class CustomMessage extends StatefulWidget {
  @override
  _CustomMessageState createState() => _CustomMessageState();
}

// state class
// We will replace this class in each of the examples below
class _CustomMessageState extends State<CustomMessage> {
  // state variable
  String _message = ' ';
  String _cellNumber = ' ';
  String _sendResult = ' ';

  void _sendOne() {
    http.get(
        'http://3.140.179.89:5000/sms?number=$_cellNumber&message_type=single&message=$_message');

    setState(() {
      _sendResult = '''
        $_message
        has been sent to
        $_cellNumber
        ''';
    });
  }

  void _sendAll() {
    http.get(
        'http://3.140.179.89:5000/sms?number=$_cellNumber&message_type=custom&message=$_message');

    setState(() {
      _sendResult = '''
        $_message
        has been sent to
        $_cellNumber
        ''';
    });
  }

  // The State class must include this method, which builds the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[900],
        appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Align(
              child: Text('Administration'),
              alignment: Alignment.centerRight,
            )),
        body: Column(
          children: [
            Text(
              'Custom Message',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.left,
            ),
            TextField(
              onChanged: (text) {
                this._changeString(text, "message");
              },
            ),
            Text(
              "Enter the phone number to send message to or hit Send to All",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            TextField(
              onChanged: (text) {
                this._changeString(text, "cellNumber");
              },
            ),
            RaisedButton(
              //                         <--- Button
              child: Text('Send'),
              onPressed: () {
                this._sendOne();
                Text(
                  this._sendResult,
                  textAlign: TextAlign.center,
                );
                //Navigator.push(context,
                // MaterialPageRoute(builder: (context) => CustomMessage()));
              },
            ),
            RaisedButton(
              //                         <--- Button
              child: Text('Send to All'),
              onPressed: () {
                this._sendAll();
                Text(
                  this._sendResult,
                  textAlign: TextAlign.center,
                );
                //Navigator.push(context,
                // MaterialPageRoute(builder: (context) => CustomMessage()));
              },
            ),
            Text(
              this._sendResult,
              textAlign: TextAlign.center,
            ),
            TextButton(
                child: Container(
                    alignment: Alignment.center,
                    width: 1000,
                    child: Text('Return Home',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.greenAccent[700],
                        ))),
                onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()))
                    }),
          ],
        ));
  }

  // this private method is run whenever the button is pressed
  void _changeString(String text, String type) {
    // Using the callback State.setState() is the only way to get the build
    // method to rerun with the updated state value.
    if (type == "message")
      setState(() {
        this._message = text;
      });
    else if (type == "cellNumber")
      setState(() {
        this._cellNumber = text;
      });
  }
}

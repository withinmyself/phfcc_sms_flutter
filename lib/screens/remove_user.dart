import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:phfcc_sms/screens/home.dart';

class RemoveUser extends StatefulWidget {
  @override
  _RemoveUserState createState() => _RemoveUserState();
}

// state class
// We will replace this class in each of the examples below
class _RemoveUserState extends State<RemoveUser> {
  // state variable
  String _cellNumber = ' ';
  String _sendResult = ' ';

  void _removeUser() {
    http.get('http://3.140.179.89:5000/delete-user?phone_number=$_cellNumber');

    http.get(
        'http://3.140.179.89:5000/sms?number=$_cellNumber&message=You will no longer receive weekly text alerts.');

    setState(() {
      _sendResult = '''
      $_cellNumber has been removed from the database. 
      They will no longer receive weekly text alerts.
      They can still use our app to see messages.        
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
              'Type in the phone number of the user you would like to remove',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.left,
            ),
            TextField(onChanged: (text) {
              this._changeNumber(text);
            }),
            RaisedButton(
              //                         <--- Button
              child: Text('Subscribe'),
              onPressed: () {
                this._removeUser();
                Text(
                  this._sendResult,
                  textAlign: TextAlign.center,
                );
                //Navigator.push(context,
                // MaterialPageRoute(builder: (context) => RemoveUser()));
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
  void _changeNumber(String text) {
    // Using the callback State.setState() is the only way to get the build
    // method to rerun with the updated state value.

    setState(() {
      this._cellNumber = text;
    });
  }
}

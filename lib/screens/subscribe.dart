import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:phfcc_sms/screens/home.dart';

class AddNewUser extends StatefulWidget {
  @override
  _AddNewUserState createState() => _AddNewUserState();
}

// state class
// We will replace this class in each of the examples below
class _AddNewUserState extends State<AddNewUser> {
  // state variable
  String _firstName = 'a ';
  String _lastName = ' ';
  String _cellNumber = ' ';
  String _sendResult = ' ';

  void _addUser() {
    http.get(
        'http://3.140.179.89:5000/add-user?first_name=$_firstName&last_name=$_lastName&phone_number=$_cellNumber');

    http.get(
        'http://3.140.179.89:5000/sms?number=$_cellNumber&message=You are now set up to receive weekly text alerts.');

    setState(() {
      _sendResult = '''
        $_firstName $_lastName
        has been added for weekly text alerts at 
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
              'First Name',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.left,
            ),
            TextField(onChanged: (text) {
              this._changeString(text, "firstName");
            }),
            Text(
              'Last Name',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.left,
            ),
            TextField(
              onChanged: (text) {
                this._changeString(text, "lastName");
              },
            ),
            Text(
              'Phone Number',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.left,
            ),
            TextField(
              onChanged: (text) {
                this._changeString(text, "cellNumber");
              },
            ),
            RaisedButton(
              //                         <--- Button
              child: Text('Subscribe'),
              onPressed: () {
                this._addUser();
                Text(
                  this._sendResult,
                  textAlign: TextAlign.center,
                );
                //Navigator.push(context,
                // MaterialPageRoute(builder: (context) => AddNewUser()));
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
    if (type == "firstName")
      setState(() {
        this._firstName = text;
      });
    else if (type == "lastName")
      setState(() {
        this._lastName = text;
      });
    else if (type == "cellNumber")
      setState(() {
        this._cellNumber = text;
      });
  }
}

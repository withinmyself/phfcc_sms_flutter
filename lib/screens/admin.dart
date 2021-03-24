import 'package:flutter/material.dart';
import 'package:phfcc_sms/widgets/text_section.dart';
import 'package:phfcc_sms/widgets/phfcc_buttons.dart';
import 'package:phfcc_sms/screens/home.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.deepOrange[900],
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Align(
            child: Text('Administration'),
            alignment: Alignment.centerRight,
          )),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.all(5.0),
          child: PhfccButton(Colors.black45, 'Covid Message', 'Change Covid'),
          height: 50.0,
          alignment: Alignment.center,
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          child:
              PhfccButton(Colors.black45, 'Weather Message', 'Change Weather'),
          height: 50.0,
          alignment: Alignment.center,
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          child: PhfccButton(
              Colors.black45, 'Meetings Message', 'Change Meetings'),
          height: 50.0,
          alignment: Alignment.center,
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          child: PhfccButton(Colors.black45, 'Prayer Message', 'Change Prayer'),
          height: 50.0,
          alignment: Alignment.center,
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          child: PhfccButton(Colors.black45, 'Remove User', 'Remove User'),
          height: 50.0,
          alignment: Alignment.center,
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          child: PhfccButton(Colors.black45, 'Database Report', 'Database Report'),
          height: 50.0,
          alignment: Alignment.center,
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          child: PhfccButton(Colors.black45, 'Custom Message', 'Custom Message'),
          height: 50.0,
          alignment: Alignment.center,
        ),
        TextSection(Colors.black, ''),
        TextButton(
            child: Text('Return Home',
                style: TextStyle(color: Colors.greenAccent[700], fontSize: 30)),
            onPressed: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()))
                }),
      ]),
    );
  }
}

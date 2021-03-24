import 'package:flutter/material.dart';
import 'package:phfcc_sms/screens/get_covid_message.dart';
import 'package:phfcc_sms/screens/get_weather_message.dart';
import 'package:phfcc_sms/screens/admin.dart';
import 'package:phfcc_sms/screens/change_covid_message.dart';
import 'package:phfcc_sms/screens/change_weather_messsage.dart';
import 'package:phfcc_sms/screens/change_prayer_message.dart';
import 'package:phfcc_sms/screens/change_meetings_message.dart';
import 'package:phfcc_sms/screens/subscribe.dart';
import 'package:phfcc_sms/screens/remove_user.dart';
import 'package:phfcc_sms/screens/security.dart';
import 'package:phfcc_sms/screens/reports.dart';
import 'package:phfcc_sms/screens/send_custom_message.dart';

class PhfccButton extends StatelessWidget {
  final Color _color;
  final String _name;
  final String _messageType;

  PhfccButton(this._color, this._name, this._messageType);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: _color,
        ),
        child: TextButton(
            child: Text(
              '$_name',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontSize: 25,
                letterSpacing: -0.5,
              ),
            ),
            onPressed: () {
              // Switch to different view and pull current
              // covid message from api to display on screen
              if (this._messageType == 'Covid') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CovidMessage()));
              } else if (this._messageType == 'Weather') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WeatherMessage()));
              } else if (this._messageType == 'Subscribe') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNewUser()));
              } else if (this._messageType == 'Admin Options') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecurityPass()));
              } else if (this._messageType == 'Change Covid') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeCovidMessage()));
              } else if (this._messageType == 'Change Weather') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeWeatherMessage()));
              } else if (this._messageType == 'Change Prayer') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePrayerMessage()));
              } else if (this._messageType == 'Change Meetings') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeMeetingsMessage()));
              } else if (this._messageType == 'Edit User') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DatabaseReport()));
              } else if (this._messageType == 'Database Report') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DatabaseReport()));
              } else if (this._messageType == 'Remove User') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RemoveUser()));
              } else if (this._messageType == 'Custom Message') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomMessage()));
              }
            }));
  }
}

class WeatherButton extends StatelessWidget {
  final Color _color;
  final String _name;

  WeatherButton(this._color, this._name);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130.0,
        width: 200.0,
        decoration: BoxDecoration(
          color: _color,
        ),
        alignment: Alignment.center,
        child: TextButton(
            child: Text('$_name',
                style: TextStyle(
                  fontSize: 35.0,
                )),
            onPressed: () {
              // Switch to different view and pull current
              // weather message from api to display on screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WeatherMessage()));
            }));
  }
}

class AdminButton extends StatelessWidget {
  final Color _color;
  final String _name;

  AdminButton(this._color, this._name);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: TextButton(
              child: Text('$_name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _color,
                    fontSize: 10.0,
                  )),
              onPressed: () {
                if (this._name == 'Covid') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CovidMessage()));
                } else if (this._name == 'Admin Options') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminPage()));
                }
              }))
    ]);
  }
}

class LeftButton extends StatelessWidget {
  final Color _color;
  final String _name;

  LeftButton(this._color, this._name);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          height: 30.0,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: TextButton(
              child: Text('$_name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _color,
                    fontSize: 10.0,
                  )),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WeatherMessage()));
              })),
      Container(
        child: Text('    '),
      ),
      Container(
        child: Text('    '),
      ),
      Container(
        child: Text('    '),
      ),
      Container(
        child: Text('    '),
      ),
    ]);
  }
}

class SubscribeButton extends StatelessWidget {
  final Color _color;
  final String _name;

  SubscribeButton(this._color, this._name);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150.0,
        width: 200.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _color,
        ),
        child: TextButton(
            child: Text('$_name',
                style: TextStyle(
                  fontSize: 35.0,
                )),
            onPressed: () {
              // Switch to different view and pull current
              // covid message from api to display on screen
              // Navigator.push(context,
              //   MaterialPageRoute(builder: (context) => AdminWidget()));
            }));
  }
}

class ChangeMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150.0,
        width: 200.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: TextButton(
            child: Text('Change Messages',
                style: TextStyle(
                  fontSize: 35.0,
                )),
            onPressed: () {
              // Switch to different view and pull current
              // covid message from api to display on screen
              // Navigator.push(context,
              //    MaterialPageRoute(builder: (context) => MessagePage()));
            }));
  }
}

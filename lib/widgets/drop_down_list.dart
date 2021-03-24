import 'package:flutter/material.dart';
import 'package:phfcc_sms/screens/get_covid_message.dart';
import 'package:phfcc_sms/screens/get_weather_message.dart';
import 'package:phfcc_sms/screens/get_meetings_message.dart';
import 'package:phfcc_sms/screens/get_prayer_message.dart';

/// This is the main application widget.
class DropDownList extends StatelessWidget {
  static const String _title = 'Drop Down List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: DropDownWidget(),
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class DropDownWidget extends StatefulWidget {
  DropDownWidget({Key key}) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

/// This is the private State class that goes with DropDownWidget.
class _DropDownWidgetState extends State<DropDownWidget> {
  String _dropdownValue = 'Messages';

  void _getCovidMessage() => {
        if (this._dropdownValue == 'Covid-19')
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CovidMessage()))
          }
        else if (this._dropdownValue == 'Weather')
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WeatherMessage()))
          }
          else if (this._dropdownValue == 'Meetings')
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MeetingsMessage()))
          }
          else if (this._dropdownValue == 'Prayer')
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PrayerMessage()))
          }
      };

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _dropdownValue,
      icon: Icon(Icons.wysiwyg, color: Colors.white),
      dropdownColor: Colors.black45,
      iconSize: 36,
      
      style:  TextStyle(color: Colors.white, fontFamily: 'Roboto',
            fontSize: 25,
            letterSpacing: -0.5,
            
            ),
      onChanged: (String newValue) {
        setState(() {
          this._dropdownValue = newValue;
          this._getCovidMessage();
          this._dropdownValue = 'Messages';
        });
      },
      items: <String>[
        'Messages',
        'Covid-19',
        'Weather',
        'Meetings',
        'Prayer'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

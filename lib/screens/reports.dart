import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:phfcc_sms/widgets/image_banner.dart';
import 'package:phfcc_sms/widgets/text_section.dart';

Future<Message> fetchMessage() async {
  final response = await http.get('http://3.140.179.89:5000/reports');

  if (response.statusCode == 200) {
    return Message.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to retrieve message.');
  }
}

class Message {
  final String report;

  Message({this.report});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      report: json['Report'][0],
    );
  }
}

void main() => runApp(DatabaseReport());

class DatabaseReport extends StatefulWidget {
  DatabaseReport({Key key}) : super(key: key);

  @override
  _DatabaseReport createState() => _DatabaseReport();
}

class _DatabaseReport extends State<DatabaseReport> {
  Future<Message> futureMessage;

  @override
  void initState() {
    super.initState();
    futureMessage = fetchMessage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Database Report',
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.black54,
                title: Text(
                  'Database Report',
                )),
            backgroundColor: Colors.deepOrange[900],
            body: Column(children: <Widget>[
              TextBreak(),
              TextBreak(),
              TextBreak(),
              ImageBanner("assets/images/DOC_CHALISE_HALF.png"),
              TextBreak(),
              FutureBuilder<Message>(
                  future: futureMessage,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                  margin: EdgeInsets.all(30),
                                  alignment: Alignment.centerLeft,
                                  child: Text(snapshot.data.report))));
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error} ${snapshot.data}");
                    }
                    return CircularProgressIndicator();
                  }),
            ]),
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.black,
                unselectedItemColor: Colors.greenAccent[700],
                selectedItemColor: Colors.green,
                items: [
                  BottomNavigationBarItem(
                    icon: IconButton(
                        onPressed: () => {Navigator.pop(context)},
                        icon: Icon(Icons.add_moderator)),
                    label: 'Back',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_moderator),
                    label: 'About',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_moderator),
                    label: 'Contact',
                  ),
                ])));
  }
}

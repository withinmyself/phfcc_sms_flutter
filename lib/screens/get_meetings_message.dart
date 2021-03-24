import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:phfcc_sms/widgets/image_banner.dart';
import 'package:phfcc_sms/widgets/text_section.dart';

Future<Message> fetchMessage() async {
  final response = await http.get(
      'http://3.140.179.89:5000/get-msg?message_type=Meetings');

  if (response.statusCode == 200) {
    return Message.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to retrieve message.');
  }
}

class Message {
  final bool autoSend;
  final String message;
  final String messageType;

  Message({this.autoSend, this.message, this.messageType});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      autoSend: json['auto-send'],
      message: json['message'],
      messageType: json['messageType'],
    );
  }
}



class MeetingsMessage extends StatefulWidget {
  MeetingsMessage({Key key}) : super(key: key);

  @override
  _MeetingsMessage createState() => _MeetingsMessage();
}

class _MeetingsMessage extends State<MeetingsMessage> {
  Future<Message> futureMessage;

  @override
  void initState() {
    super.initState();
    futureMessage = fetchMessage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Upcoming Meetings',
        home: Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.black54,
          title: Text(
        'Upcoming Meetings',
      )),
            backgroundColor: Colors.deepOrange[900],
            body: Column(children: <Widget>[
              TextBreak(),
              TextBreak(),
              TextBreak(),
              ImageBanner("assets/images/DOC_CHALISE_HALF.png"),
              TextBreak(),
              Container(
              
              
              padding: EdgeInsets.all(8.0),
              child: Column(
                
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FutureBuilder<Message>(
                        future: futureMessage,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data.message);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return CircularProgressIndicator();
                        }),
                    
                  ]),
            )
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
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_moderator),
                  label: 'About',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_moderator),
                  label: 'Contact',
                ),
              ]),
        ));
  }
}
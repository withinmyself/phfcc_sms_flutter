import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:phfcc_sms/widgets/image_banner.dart';
import 'package:phfcc_sms/widgets/text_section.dart';
import 'package:phfcc_sms/screens/admin.dart';

Future<Message> fetchMessage() async {
  final response = await http.get('http://3.140.179.89:5000/security');

  if (response.statusCode == 200) {
    return Message.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to retrieve message.');
  }
}

class Message {
  final String password;

  Message({this.password});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      password: json['password'],
    );
  }
}

void main() => runApp(SecurityPass());

class SecurityPass extends StatefulWidget {
  SecurityPass({Key key}) : super(key: key);

  @override
  _SecurityPass createState() => _SecurityPass();
}

class _SecurityPass extends State<SecurityPass> {
  Future<Message> futureMessage;

  String _password;
  String _realPassword;
  String _result = '';

  void _checkPassword() {
    if (this._password == this._realPassword) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdminPage()));
    } else {
      setState(() {
        this._result = "Wrong Password";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    futureMessage = fetchMessage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Security',
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black54,
              title: Text(
                'Administration',
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
                            this._realPassword = snapshot.data.password;
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return Text(this._result);
                        }),
                    // TextButton(
                    //   child: Text('Login'),
                    //   onPressed: () => this._checkPassword(),
                    // ),
                  ]),
            ),
            Text('Enter Admin Password'),
            TextField(
              style: TextStyle(color:Colors.greenAccent[800]),
              obscuringCharacter: '#',
              cursorColor: Colors.greenAccent[700],
              obscureText: true,
             onChanged: (text) {
              setState(() {
                this._password = text;
                this._checkPassword();
              });
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

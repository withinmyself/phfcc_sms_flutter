import 'package:flutter/material.dart';
import 'package:phfcc_sms/widgets/image_banner.dart';
import 'package:phfcc_sms/widgets/text_section.dart';
import 'package:phfcc_sms/widgets/phfcc_buttons.dart';
import 'package:phfcc_sms/strings/strings.dart';
import 'package:phfcc_sms/widgets/drop_down_list.dart';
import 'package:phfcc_sms/screens/security.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.deepOrange[900],
      appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text(
            'PHFCC Messaging App',
          )),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextBreak(),
            ImageBanner("assets/images/DOC_CHALISE_HALF.png"),
            TextBreak(),
            Welcome(Colors.black45, welcome),
            TextSection(Colors.black45, subscribe),
            TextBreak(),
            Container(
              child: PhfccButton(Colors.black54, "Subscribe", "Subscribe"),
              height: 45.0,
              alignment: Alignment.center,
            ),
            TextBreak(),
            TextSection(Colors.black45, messages),
            TextBreak(),
            Container(
                alignment: Alignment.center,
                height: 45,
                color: Colors.black54,
                child: DropDownWidget()),
            TextBreak(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.greenAccent[400],
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecurityPass()))
                      },
                  icon: Icon(Icons.dashboard_rounded)),
              label: 'Admin',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_customize),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              label: 'Contact',
            ),
          ]),
      //   ),
      // ),
    );
  }
}

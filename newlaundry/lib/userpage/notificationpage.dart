import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  NotificationPageState createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'การแจ้งเตือน',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Prompt',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: Colors.blue[100],
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(height: 100),
          Container(
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/clock.png', height: 100, width: 100),
                  SizedBox(height: 10),
                  Text(
                    'ยังไม่มีรายกาย',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Prompt',
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

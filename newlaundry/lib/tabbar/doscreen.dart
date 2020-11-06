import 'package:flutter/material.dart';

class DoScreen extends StatefulWidget {
  @override
  DoScreenState createState() => DoScreenState();
}

class DoScreenState extends State<DoScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              width: double.maxFinite,
              child: InkWell(
                onTap: () => {},
                child: Card(
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "คำสั่งซักอบรีด",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Prompt',
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

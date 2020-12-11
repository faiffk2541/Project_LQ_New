import 'package:flutter/material.dart';
import 'package:newlaundry/tabbar/donescreen.dart';
import 'package:newlaundry/tabbar/doningscreen.dart';

class HistoryPage extends StatefulWidget {
  final String uid;
  HistoryPage(this.uid);
  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.uid);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'ประวัติการใช้งาน',
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
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text(
                    'รอดำเนินการ',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontFamily: 'Prompt',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Tab(
                  child: Text(
                    'เสร็จสิ้น',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontFamily: 'Prompt',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [DoingScreen(widget.uid), DoneScreen(widget.uid)],
          ),
        ),
      ),
    );
  }
}

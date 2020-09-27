import 'package:flutter/material.dart';
import 'package:newlaundry/navigationbar.dart';
import 'package:newlaundry/userpage/historypage.dart';

class AddCartPage extends StatefulWidget {
  @override
  AddCartState createState() => AddCartState();
}

class AddCartState extends State<AddCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              'สรุปรายการ',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Prompt',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Card(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Container(
              padding: EdgeInsets.only(top: 10),
              height: 195,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Icon(Icons.pin_drop, color: Colors.red, size: 40),
                      SizedBox(height: 10, width: 10),
                      Flexible(
                        child: Text(
                          'ร้านซักรีด',
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Prompt',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                    height: 5,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Icon(Icons.date_range, color: Colors.blue, size: 40),
                      SizedBox(height: 10, width: 10),
                      Flexible(
                        child: Text(
                          'รายวัน',
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Prompt',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                    height: 5,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Icon(Icons.fast_forward, color: Colors.blue, size: 40),
                      SizedBox(height: 10, width: 10),
                      Flexible(
                        child: Text(
                          'ซักอบรีด',
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Prompt',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('1x',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 20),
                          ),
                          Text('เสื้อ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 210),
                          ),
                          Text('25',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('1x',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 20),
                          ),
                          Text('กางเกง',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 175),
                          ),
                          Text('25',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('1x',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 20),
                          ),
                          Text('กระโปรง',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 170),
                          ),
                          Text('25',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 50),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 50,
              child: RaisedButton(
                child: Text(
                  "ส่งรายการ",
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontFamily: 'Prompt',
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AddCartPage()),
                  // );
                  showAlertDialog(context);
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'Prompt',
          fontSize: 18,
          fontWeight: FontWeight.w400),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavigationBarPage()),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "ทำรายการสำเร็จ",
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'Prompt',
          fontSize: 18,
          fontWeight: FontWeight.w400),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

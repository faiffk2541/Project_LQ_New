import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/navigationbar.dart';
import 'package:newlaundry/userpage/detailservice/detailservicewashing.dart';
import 'package:newlaundry/userpage/historypage.dart';

class AddCartPage extends StatefulWidget {
  final String laundryUID;
  const AddCartPage({Key key, this.laundryUID}) : super(key: key);
  @override
  AddCartState createState() => AddCartState();
}

class AddCartState extends State<AddCartPage> {
  List model;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 35, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
              Container(
                child: Padding(
                  padding: EdgeInsets.only(right: 30, left: 30),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            SizedBox(width: 10, height: 10),
                            Text(
                              'ชื่อร้าน',
                              style: TextStyle(
                                  height: 1.5,
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        // SizedBox(height: 15),
                        // Row(
                        //   children: [
                        //     Icon(
                        //       Icons.store_mall_directory,
                        //       color: Colors.blue,
                        //     ),
                        //     SizedBox(width: 10, height: 10),
                        //     Text(
                        //       'รายวัน',
                        //       style: TextStyle(
                        //           height: 1.5,
                        //           color: Colors.black,
                        //           fontFamily: 'Prompt',
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w300),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(height: 15),
                        // Row(
                        //   children: [
                        //     Icon(
                        //       Icons.local_grocery_store,
                        //       color: Colors.green,
                        //     ),
                        //     SizedBox(width: 10, height: 10),
                        //     Text(
                        //       'ซักอบรีด',
                        //       style: TextStyle(
                        //           height: 1.5,
                        //           color: Colors.black,
                        //           fontFamily: 'Prompt',
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w300),
                        //     )
                        //   ],
                        // )
                      ],
                    ),
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
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '1 x',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20, left: 20),
                              ),
                              Text(
                                'เสื้อ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 210),
                              ),
                              Text(
                                '25',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
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
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '1 x',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20, left: 20),
                              ),
                              Text(
                                'เสื้อ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 210),
                              ),
                              Text(
                                '25',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                height: 50,
                width: 200,
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: Text(
                    'ส่งรายการ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Prompt',
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  AlertDialog dialog = new AlertDialog(
    title: Center(
      child: Text(
        "ยืนยันการทำรายการ",
        style: TextStyle(
            color: Colors.red,
            fontFamily: 'Prompt',
            fontSize: 18,
            fontWeight: FontWeight.w400),
      ),
    ),
    content: new Container(
      height: 50,
      child: new Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {},
                  elevation: 0,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ยกเลิก',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Prompt',
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 30),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationBarPage()),
                    );
                  },
                  elevation: 0,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'บันทึก',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Prompt',
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(context: context, child: dialog);
}

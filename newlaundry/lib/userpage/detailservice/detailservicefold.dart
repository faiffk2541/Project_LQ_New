import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/userpage/cart/addcart.dart';

class DetailServiceFoldPage extends StatefulWidget {
  final String laundryUID;

  DetailServiceFoldPage(this.laundryUID);
  @override
  DetailServiceFoldState createState() => DetailServiceFoldState();
}

class DetailServiceFoldState extends State<DetailServiceFoldPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  void add() {
    setState(() {
      count++;
    });
  }

  void minus() {
    setState(() {
      if (count != 0) count--;
    });
  }

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
                  'รายการซักพับ',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontFamily: 'Prompt',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 550,
                child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Laundry")
                      .document(widget.laundryUID)
                      .collection("TypeOfService")
                      .document("typeofservice")
                      .collection("Fold")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return Text('Some Error');
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print('it can connect to firebase of service');
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot TypeOfService =
                                snapshot.data.documents[index];
                            return Stack(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          child: Image.asset(
                                              'assets/laundry-basket.png'),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child: Column(
                                          children: [
                                            Text(
                                              TypeOfService.data()['Type'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Prompt',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              TypeOfService.data()['Price'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Prompt',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    minus();
                                                  },
                                                  child: Image.asset(
                                                      'assets/minus.png',
                                                      width: 30,
                                                      height: 30),
                                                ),
                                                SizedBox(width: 20),
                                                Text(
                                                  '$count',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Prompt',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                SizedBox(width: 20),
                                                InkWell(
                                                  onTap: () {
                                                    add();
                                                  },
                                                  child: Image.asset(
                                                      'assets/add.png',
                                                      width: 30,
                                                      height: 30),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    }
                  },
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 15),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "รวมทั้งหมด",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Prompt',
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "$count บาท",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Prompt',
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          "ใส่ตระกร้า",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontFamily: 'Prompt',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddCartPage()),
                          );
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
            ],
          ),
        ),
      ),
    );
  }
}

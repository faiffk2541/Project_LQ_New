import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newlaundry/userpage/profileuser/editaccount.dart';

class AccountPage extends StatefulWidget {
  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String login;
  String urlPic, fname, lname, birthday, sex, phone, address;

  @override
  // void initState() {
  //   super.initState();
  //   findDisplay();
  // }

  // Future<void> findDisplay() async {
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //   if (firebaseAuth.currentUser != null) {
  //     setState(() {
  //       login = firebaseAuth.currentUser.email;
  //       print(firebaseAuth.currentUser.uid);
  //     });
  //   }
  // }

  // final databaseReference = FirebaseDatabase.instance.reference();

  // void getData() {
  //   databaseReference.once().then((DataSnapshot snapshot) {
  //     print('Data : ${snapshot.value}');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      // body: SingleChildScrollView(
      //   child: Container(
      //     child: Column(
      //       children: [
      //         Padding(
      //           padding: EdgeInsets.only(top: 35, left: 15),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               IconButton(
      //                 icon: Icon(Icons.arrow_back_ios),
      //                 color: Colors.white,
      //                 onPressed: () {
      //                   Navigator.pop(context);
      //                 },
      //               ),
      //             ],
      //           ),
      //         ),
      //         Container(
      //           alignment: Alignment.topCenter,
      //           child: Text(
      //             'บัญชีของฉัน',
      //             style: TextStyle(
      //                 color: Colors.blue[900],
      //                 fontFamily: 'Prompt',
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         Container(
      //           child: StreamBuilder(
      //             stream: Firestore.instance
      //                 .collection("Customer")
      //                 .document(firebaseAuth.currentUser.uid)
      //                 .snapshots(),
      //             builder: (context, snapshot) {
      //               return ListView.builder(
      //                   itemCount: snapshot.data.documents.length,
      //                   itemBuilder: (context, index) {
      //                     DocumentSnapshot Customer =
      //                         snapshot.data.documents[index];
      //                     return Column(
      //                       children: [
      //                         Padding(
      //                           padding: EdgeInsets.only(top: 20, bottom: 10),
      //                           child: Stack(
      //                             children: [
      //                               CircleAvatar(
      //                                 radius: 50,
      //                                 child: ClipOval(
      //                                   child: Image.asset(
      //                                     'assets/boy.png',
      //                                     fit: BoxFit.fill,
      //                                   ),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         )
      //                       ],
      //                     );
      //                   });
      //             },
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
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
              'บัญชีของฉัน',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Prompt',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/boy.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditAccount()),
                        );
                      },
                      padding: EdgeInsets.only(left: 20, right: 20),
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'แก้ไขโปรไฟล์',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'ชื่อ',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$fname',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'นามสกุล',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$lname',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'อีเมล์',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$login',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'วันเกิด',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$birthday',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'เพศ',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$sex',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'เบอร์โทร',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$phone',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'ที่อยู่',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$address',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

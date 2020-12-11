import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Confirmation extends StatefulWidget {
  @override
  ConfirmationState createState() => ConfirmationState();
}

class ConfirmationState extends State<Confirmation> {
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
                padding: EdgeInsets.only(top: 50, left: 15),
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
                  'ยืนยันออเดอร์',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontFamily: 'Prompt',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 600,
                child: StreamBuilder(
                    stream: Firestore.instance
                        .collection("OrderLaundry")
                        .doc(firebaseAuth.currentUser.uid)
                        .collection("Confirmation")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        print('it can connect to firebase');
                        return CircularProgressIndicator();
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot Confirmation =
                                  snapshot.data.documents[index];
                              return Dismissible(
                                background: slideRightBackground(),
                                secondaryBackground: slideLeftBackground(),
                                key: Key(
                                    snapshot.data.documents.toString()[index]),
                                child: InkWell(
                                  onTap: () {},
                                  child: Card(
                                    child: ListTile(
                                      title: Container(
                                        margin: EdgeInsets.only(
                                            left: 0, right: 0, bottom: 0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('ชื่อลูกค้า : ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue[900],
                                                                fontFamily:
                                                                    'Prompt',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                        Text(
                                                            Confirmation.data()[
                                                                'CustomerName'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue[900],
                                                                fontFamily:
                                                                    'Prompt',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text('บริการ : ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue[900],
                                                                fontFamily:
                                                                    'Prompt',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                        Text(
                                                            Confirmation.data()[
                                                                'Service'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue[900],
                                                                fontFamily:
                                                                    'Prompt',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text('ราคา : ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue[900],
                                                                fontFamily:
                                                                    'Prompt',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                        Text(
                                                            Confirmation.data()[
                                                                    'Total']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue[900],
                                                                fontFamily:
                                                                    'Prompt',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                        Text('  บาท',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue[900],
                                                                fontFamily:
                                                                    'Prompt',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text('สถานะ : ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue[900],
                                                                fontFamily:
                                                                    'Prompt',
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                        Text(
                                                            Confirmation.data()[
                                                                'Status'],
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontFamily:
                                                                    'Prompt',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // trailing: Container(
                                      //   child: FloatingActionButton(
                                      //     onPressed: () {},
                                      //     child: Icon(
                                      //       Icons.check,
                                      //     ),
                                      //     shape: RoundedRectangleBorder(
                                      //         borderRadius: BorderRadius.all(
                                      //             Radius.circular(16.0))),
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " ยืนยัน",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " ลบ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}

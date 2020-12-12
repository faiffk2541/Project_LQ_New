import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoryLaundry extends StatefulWidget {
  @override
  HistoryLaundryState createState() => HistoryLaundryState();
}

class HistoryLaundryState extends State<HistoryLaundry> {
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
                  'ประวัติลูกค้า',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontFamily: 'Prompt',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 620,
                child: StreamBuilder(
                    stream: Firestore.instance
                        .collection("Laundry")
                        .doc(firebaseAuth.currentUser.uid)
                        .collection("History")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        print('it can connect to firebase');
                        return CircularProgressIndicator();
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot History =
                                  snapshot.data.documents[index];
                              return Card(
                                child: ListTile(
                                  title: Container(
                                    margin: EdgeInsets.only(
                                        left: 0, right: 0, bottom: 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(0),
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
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                    Text(
                                                        History.data()[
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
                                                        overflow: TextOverflow
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
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                    Text(
                                                        History.data()[
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
                                                        overflow: TextOverflow
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
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                    Text(
                                                        History.data()['Total']
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
                                                        overflow: TextOverflow
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
                                                        overflow: TextOverflow
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
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                    Text(
                                                        History.data()[
                                                            'Status'],
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontFamily:
                                                                'Prompt',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
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
}

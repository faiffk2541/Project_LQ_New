import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DoingScreen extends StatefulWidget {
  @override
  DoingScreenState createState() => DoingScreenState();
}

class DoingScreenState extends State<DoingScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: StreamBuilder(
          stream: Firestore.instance
              .collection("Order")
              .doc(firebaseAuth.currentUser.uid)
              .collection("TypeOfService")
              .doc("typeofservice")
              .collection("Washing")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('it can connect to firebase');
              return CircularProgressIndicator();
            } else {
              print(snapshot.data.documents[0].data()['order'].length);
              return ListView.builder(
                  itemCount: snapshot.data.documents[0].data()['order'].length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 15, bottom: 10),
                            child: Column(
                              children: [
                                Text(
                                  'รายการ : ' +
                                      snapshot.data.documents[0].data()['order']
                                          [index]['Type'],
                                  style: TextStyle(
                                      color: Colors.blue[900],
                                      fontFamily: 'Prompt',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, bottom: 10),
                            child: Column(
                              children: [
                                Text(
                                  'จำนวน  : ' +
                                      snapshot.data.documents[0]
                                          .data()['order'][index]['Count']
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.blue[900],
                                      fontFamily: 'Prompt',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}

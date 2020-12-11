import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DoneScreen extends StatefulWidget {
  final String uid;
  DoneScreen(this.uid);
  @override
  DoneScreenState createState() => DoneScreenState();
}

class DoneScreenState extends State<DoneScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: StreamBuilder(
          // ignore: deprecated_member_use
          stream: Firestore.instance
              .collection("OrderCustomer")
              .doc("ordercustomer")
              .collection(firebaseAuth.currentUser.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('it can connect to firebase');
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    // ignore: non_constant_identifier_names
                    DocumentSnapshot OrderCustomer =
                        snapshot.data.documents[index];
                    return Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 10, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/checked.png',
                                      height: 70, width: 70),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(OrderCustomer.data()['LaundryName'],
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontFamily: 'Prompt',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.ellipsis),
                                  SizedBox(height: 10),
                                  Text(OrderCustomer.data()['Service'],
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontFamily: 'Prompt',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.ellipsis),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                          OrderCustomer.data()['Total']
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontFamily: 'Prompt',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis),
                                      Text(
                                        '  บาท',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontFamily: 'Prompt',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
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

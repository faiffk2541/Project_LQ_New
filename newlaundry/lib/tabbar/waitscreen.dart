import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/laundrypage/todolist/order/detailorder.dart';

class WaitScreen extends StatefulWidget {
  final String customerID;
  WaitScreen(this.customerID);
  @override
  WaitScreenState createState() => WaitScreenState();
}

class WaitScreenState extends State<WaitScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: StreamBuilder(
          stream: Firestore.instance
              .collection("Customer")
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
                                  Image.asset('assets/laundry-basket.png',
                                      height: 70, width: 70),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('ชื่อร้าน : ',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontFamily: 'Prompt',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis),
                                      Text(Confirmation.data()['LaundryName'],
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontFamily: 'Prompt',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text('บริการ : ',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontFamily: 'Prompt',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis),
                                      Text(Confirmation.data()['Service'],
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontFamily: 'Prompt',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text('ราคา : ',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontFamily: 'Prompt',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis),
                                      Text(
                                          Confirmation.data()['Total']
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontFamily: 'Prompt',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis),
                                      Text(
                                        '  บาท',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontFamily: 'Prompt',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text('สถานะ : ',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontFamily: 'Prompt',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis),
                                      Text(Confirmation.data()['Status'],
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'Prompt',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('ออเดอร์ : ',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontFamily: 'Prompt',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis),
                                      IconButton(
                                          //icon: Icon(Icons.list_alt),
                                          onPressed: () {
                                            List orders =
                                                Confirmation.data()['order'];
                                            print(orders);
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           DetailOrder(
                                            //               order: orders)),
                                            // );
                                          })
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

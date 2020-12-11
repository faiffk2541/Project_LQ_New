import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DoingScreen extends StatefulWidget {
  final String uid;
  DoingScreen(this.uid);
  @override
  DoingScreenState createState() => DoingScreenState();
}

class DoingScreenState extends State<DoingScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String laundryName, service, total;

  @override
  void initState() {
    super.initState();
    //getData();
  }

  // Future<Null> getData() async {
  //   await Firebase.initializeApp().then((value) async {
  //     await FirebaseAuth.instance.authStateChanges().listen((event) async {
  //       String uid = event.uid;
  //       print("uid of user   ===> $uid");

  //       DocumentReference querySnapshot =
  //           await Firestore.instance.collection("OrderCustomer").doc(uid);
  //       DocumentSnapshot snap =
  //           await Firestore.instance.collection("OrderCustomer").doc(uid).get();
  //       print(snap.data()["LaundryName"].toString());
  //       print(snap.data()["Service"].toString());
  //       print(snap.data()["Total"].toString());
  //       await Firestore.instance
  //           .collection('OrderCustomer')
  //           .doc(uid)
  //           .snapshots()
  //           .listen((event) {
  //         setState(() {
  //           laundryName = snap.data()["LaundryName"].toString();
  //           service = snap.data()["Service"].toString();
  //           total = snap.data()["Total"].toString();
  //         });
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        // body: Column(
        //   children: [
        //     SizedBox(height: 100),
        //     "$laundryName" == "null"
        //         ? Container(
        //             child: Center(
        //               child: Column(
        //                 children: [
        //                   //CircularProgressIndicator(),
        //                   Image.asset('assets/clock.png',
        //                       height: 100, width: 100),
        //                   SizedBox(height: 10),
        //                   Text(
        //                     'ยังไม่มีรายกาย',
        //                     style: TextStyle(
        //                         color: Colors.black,
        //                         fontFamily: 'Prompt',
        //                         fontSize: 20,
        //                         fontWeight: FontWeight.w300),
        //                   )
        //                 ],
        //               ),
        //             ),
        //           )
        //         : Container(
        //             margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(20),
        //             ),
        //             child: Row(
        //               children: [
        //                 Container(
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(
        //                         top: 20, left: 20, right: 10, bottom: 20),
        //                     child: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         Image.asset('assets/laundry-basket.png',
        //                             height: 70, width: 70),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 SizedBox(height: 10),
        //                 Expanded(
        //                   child: Padding(
        //                     padding: EdgeInsets.symmetric(horizontal: 10),
        //                     child: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Text('$laundryName',
        //                             style: TextStyle(
        //                                 color: Colors.blue[900],
        //                                 fontFamily: 'Prompt',
        //                                 fontSize: 16,
        //                                 fontWeight: FontWeight.w400),
        //                             overflow: TextOverflow.ellipsis),
        //                         SizedBox(height: 10),
        //                         Text('$service',
        //                             style: TextStyle(
        //                                 color: Colors.blue[900],
        //                                 fontFamily: 'Prompt',
        //                                 fontSize: 16,
        //                                 fontWeight: FontWeight.w400),
        //                             overflow: TextOverflow.ellipsis),
        //                         SizedBox(height: 10),
        //                         Row(
        //                           children: [
        //                             Text('$total',
        //                                 style: TextStyle(
        //                                     color: Colors.blue[900],
        //                                     fontFamily: 'Prompt',
        //                                     fontSize: 16,
        //                                     fontWeight: FontWeight.w400),
        //                                 overflow: TextOverflow.ellipsis),
        //                             Text(
        //                               '  บาท',
        //                               style: TextStyle(
        //                                   color: Colors.blue[900],
        //                                   fontFamily: 'Prompt',
        //                                   fontSize: 16,
        //                                   fontWeight: FontWeight.w400),
        //                             ),
        //                           ],
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //   ],
        // ),
        body: StreamBuilder(
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
                                  Text(OrderCustomer.data()['LaundryName'],
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontFamily: 'Prompt',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.ellipsis),
                                  SizedBox(height: 10),
                                  Text(OrderCustomer.data()['Service'],
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontFamily: 'Prompt',
                                          fontSize: 14,
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
                                  Text(OrderCustomer.data()['Status'],
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'Prompt',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.ellipsis),
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

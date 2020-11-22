import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/model/orderModel.dart';

//DocumentSnapshot snapshot;

class DoScreen extends StatefulWidget {
  @override
  DoScreenState createState() => DoScreenState();
}

class DoScreenState extends State<DoScreen> {
  final firestoreInstance = FirebaseFirestore.instance;
  // void _getData() {
  //   firestoreInstance.collection("Order").get().then((querySnapshot) {
  //     querySnapshot.docs.forEach((result) {
  //       print(result.data());
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blue[100],
          body: new StreamBuilder(
              stream: firestoreInstance.collection("Order").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return Text('Some Error');
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, indext) {
                              DocumentSnapshot order =
                                  snapshot.data.documents[indext];
                              print(order.data());

                              return Card(
                                margin: EdgeInsets.all(5),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            order.data()['Laundry'].toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Prompt',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Text(
                                            order.data()['qua'].toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Prompt',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          // Text(
                                          //   order.data()['price'].toString(),
                                          //   style: TextStyle(
                                          //       color: Colors.black,
                                          //       fontFamily: 'Prompt',
                                          //       fontSize: 14,
                                          //       fontWeight: FontWeight.w300),
                                          // ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            order.data()["price"].toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Prompt',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  );
                }
              })),
    );
  }
}

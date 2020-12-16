import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReceiveProduct extends StatefulWidget {
  @override
  ReceiveProductState createState() => ReceiveProductState();
}

class ReceiveProductState extends State<ReceiveProduct> {
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
                  'รอสินค้า',
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
                        .collection("Receiveproduct")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        print('it can connect to firebase');
                        return CircularProgressIndicator();
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot Receiveproduct =
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
                                                        Receiveproduct.data()[
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
                                                        Receiveproduct.data()[
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
                                                        Receiveproduct.data()[
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
                                                        Receiveproduct.data()[
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
                                  trailing: Container(
                                    height: 40,
                                    width: 40,
                                    child: FloatingActionButton(
                                      onPressed: () async {
                                        await Firestore.instance
                                            .collection("OrderLaundry")
                                            .doc(firebaseAuth.currentUser.uid)
                                            .collection("Receiveproduct")
                                            .doc(Receiveproduct.documentID)
                                            .delete();
                                        print('delete Done');

                                        Map<String, dynamic> laundry = Map();
                                        laundry['CustomerName'] = Receiveproduct
                                            .data()['CustomerName'];
                                        laundry['LaundryName'] = Receiveproduct
                                            .data()['LaundryName'];
                                        laundry['LaundryID'] =
                                            Receiveproduct.data()['LaundryID'];
                                        laundry['Total'] =
                                            Receiveproduct.data()['Total'];
                                        laundry['Service'] =
                                            Receiveproduct.data()['Service'];
                                        laundry['Status'] = 'เสร็จสิ้น';
                                        laundry['order'] =
                                            Receiveproduct.data()['order'];
                                        await Firestore.instance
                                            .collection("Laundry")
                                            .doc(firebaseAuth.currentUser.uid)
                                            .collection("History")
                                            .doc()
                                            .setData(laundry)
                                            .then((value) {});

                                        await Firestore.instance
                                            .collection("Customer")
                                            .doc(Receiveproduct.documentID)
                                            .collection("Receiveproduct")
                                            .doc(Receiveproduct.documentID)
                                            .delete();
                                        print('delete Done');

                                        Map<String, dynamic> customer = Map();
                                        customer['CustomerName'] =
                                            Receiveproduct.data()[
                                                'CustomerName'];
                                        customer['LaundryName'] = Receiveproduct
                                            .data()['LaundryName'];
                                        customer['LaundryID'] =
                                            Receiveproduct.data()['LaundryID'];
                                        customer['Total'] =
                                            Receiveproduct.data()['Total'];
                                        customer['Service'] =
                                            Receiveproduct.data()['Service'];
                                        customer['Status'] = 'เสร็จสิ้น';
                                        customer['order'] =
                                            Receiveproduct.data()['order'];
                                        await Firestore.instance
                                            .collection("Customer")
                                            .doc(Receiveproduct.documentID)
                                            .collection("History")
                                            .doc()
                                            .setData(customer)
                                            .then((value) {});
                                      },
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.check,
                                        size: 20,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16.0))),
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

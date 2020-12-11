import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/laundrypage/todolist/order/detailorder.dart';

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
                              String customerName =
                                  Confirmation.data()['CustomerName'];
                              return ListTile(
                                title: Container(
                                  margin: EdgeInsets.only(
                                      left: 0, right: 0, bottom: 0, top: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text('ชื่อลูกค้า : ',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontFamily: 'Prompt',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  Text(
                                                      Confirmation.data()[
                                                          'CustomerName'],
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontFamily: 'Prompt',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('บริการ : ',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontFamily: 'Prompt',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  Text(
                                                      Confirmation.data()[
                                                          'Service'],
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontFamily: 'Prompt',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('ราคา : ',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontFamily: 'Prompt',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  Text(
                                                      Confirmation.data()[
                                                              'Total']
                                                          .toString(),
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontFamily: 'Prompt',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  Text('  บาท',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontFamily: 'Prompt',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('สถานะ : ',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontFamily: 'Prompt',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  Text(
                                                      Confirmation.data()[
                                                          'Status'],
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontFamily: 'Prompt',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('ออเดอร์ : ',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontFamily: 'Prompt',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  IconButton(
                                                      icon:
                                                          Icon(Icons.list_alt),
                                                      onPressed: () {
                                                        List orders =
                                                            Confirmation.data()[
                                                                'order'];
                                                        print(orders);
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DetailOrder(
                                                                      order:
                                                                          orders)),
                                                        );
                                                      })
                                                ],
                                              )
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
                                          .collection("Confirmation")
                                          .doc(Confirmation.documentID)
                                          .delete();
                                      print('delete Done');

                                      Map<String, dynamic> laundry = Map();
                                      laundry['CustomerName'] =
                                          Confirmation.data()['CustomerName'];
                                      laundry['LaundryName'] =
                                          Confirmation.data()['LaundryName'];
                                      laundry['Total'] =
                                          Confirmation.data()['Total'];
                                      laundry['Service'] =
                                          Confirmation.data()['Service'];
                                      laundry['Status'] = 'กำลังดำเนินการ';
                                      laundry['order'] =
                                          Confirmation.data()['order'];

                                      await Firestore.instance
                                          .collection("OrderLaundry")
                                          .doc(firebaseAuth.currentUser.uid)
                                          .collection("Todo")
                                          .doc(Confirmation.documentID)
                                          .setData(laundry)
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

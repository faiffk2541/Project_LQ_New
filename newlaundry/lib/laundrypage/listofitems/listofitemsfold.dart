import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListOfItemsFold extends StatefulWidget {
  @override
  ListOfItemsFoldState createState() => ListOfItemsFoldState();
}

class ListOfItemsFoldState extends State<ListOfItemsFold> {
  String type, price;
  String uid;
  int count = 0;
  Map<String, dynamic> flod = Map();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController _typeController;
  TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _typeController = new TextEditingController(text: type);
    _priceController = new TextEditingController(text: price);
  }

  Future<void> createData(String type, String price, String uid) async {
    final databaseReference = Firestore.instance;

    await databaseReference
        .collection("Laundry")
        .document(firebaseAuth.currentUser.uid)
        .collection("TypeOfService")
        .document("typeofservice")
        .collection("Fold")
        .document()
        .setData({"Type": type, "Price": price}).then((value) {
      print('insert Successfully');
    });
  }

  Future updateData(String type, String price, String uid) async {
    final databaseReference = Firestore.instance;

    return await databaseReference
        .collection("Laundry")
        .document(firebaseAuth.currentUser.uid)
        .collection("TypeOfService")
        .document("typeofservice")
        .collection("Fold")
        .document(uid)
        .updateData({"Type": type, "Price": price});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 35, left: 15),
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
                  'เพิ่มบริการซักพับ',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontFamily: 'Prompt',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      child: RaisedButton(
                        elevation: 0,
                        onPressed: () {
                          showAlert();
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 30),
                              SizedBox(width: 10),
                              Text(
                                'เพิ่มรายการ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder(
                    stream: Firestore.instance
                        .collection("Laundry")
                        .document(firebaseAuth.currentUser.uid)
                        .collection("TypeOfService")
                        .document("typeofservice")
                        .collection("Fold")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return Text('Some Error');
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        print('it can connect to firebase');
                        return CircularProgressIndicator();
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot Fold =
                                  snapshot.data.documents[index];
                              print('Fold ==>${Fold.data()}' +
                                  'Uid ==> ${Fold.documentID}');
                              return Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 20, bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30,
                                            left: 20,
                                            right: 10,
                                            bottom: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/laundry-basket.png',
                                                height: 90,
                                                width: 90),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(Fold.data()['Type'],
                                                style: TextStyle(
                                                    color: Colors.blue[900],
                                                    fontFamily: 'Prompt',
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Text(
                                                  Fold.data()['Price'],
                                                  style: TextStyle(
                                                      color: Colors.blue[900],
                                                      fontFamily: 'Prompt',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '  บาท',
                                                  style: TextStyle(
                                                      color: Colors.blue[900],
                                                      fontFamily: 'Prompt',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                RaisedButton(
                                                  elevation: 0,
                                                  onPressed: () async {
                                                    await Firestore.instance
                                                        .collection("Laundry")
                                                        .document(firebaseAuth
                                                            .currentUser.uid)
                                                        .collection(
                                                            "TypeOfService")
                                                        .document(
                                                            "typeofservice")
                                                        .collection("Fold")
                                                        .document(
                                                            Fold.documentID)
                                                        .delete();
                                                    print('delete Done');
                                                  },
                                                  color: Colors.red,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'ลบ',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Prompt',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                RaisedButton(
                                                  elevation: 0,
                                                  onPressed: () {},
                                                  // onPressed: () async {
                                                  //   await Firestore.instance
                                                  //       .collection("Laundry")
                                                  //       .document(firebaseAuth
                                                  //           .currentUser.uid)
                                                  //       .collection(
                                                  //           "TypeOfService")
                                                  //       .document(
                                                  //           "typeofservice")
                                                  //       .collection("Fold")
                                                  //       .document(
                                                  //           Fold.documentID)
                                                  //       .update({
                                                  //     "Type": type,
                                                  //     "Price": price
                                                  //   });
                                                  //   print('update Done');
                                                  //   updateAlert(type, price);
                                                  // },
                                                  color: Colors.green[800],
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(50),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'แก้ไข',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Prompt',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
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

  Future<void> alert(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          );
        });
  }

  void showAlert() {
    AlertDialog dialog = new AlertDialog(
      content: new Container(
        width: 300.0,
        height: 300.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      'รายการ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'Prompt',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: TextFormField(
                  onChanged: (String string) {
                    type = string.trim();
                    print('insert type done');
                  },
                  decoration: InputDecoration(
                    filled: false,
                    contentPadding: EdgeInsets.only(left: 10.0, top: 10.0),
                    hintText: 'รายการ',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontFamily: 'Prompt',
                    ),
                    icon: Icon(Icons.local_grocery_store,
                        color: Colors.blue[900]),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: TextFormField(
                  onChanged: (String string) {
                    price = string.trim();
                    print('insert price done');
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: false,
                    contentPadding: EdgeInsets.only(left: 10.0, top: 10.0),
                    hintText: 'ราคา (บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontFamily: 'Prompt',
                    ),
                    icon:
                        Icon(Icons.monetization_on, color: Colors.yellow[800]),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      elevation: 0,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ยกเลิก',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Prompt',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    RaisedButton(
                      onPressed: () async {
                        if (type == null && price == null) {
                          alert('Wrong', 'กรุณากรอกกรอกรายการ');
                        } else if (type == null) {
                          alert('Wrong', 'กรุณากรอกกรอกรายการ');
                        } else if (price == null) {
                          alert('Wrong', 'กรุณากรอกกรอกรายการ');
                        } else if (type != null && price != null) {
                          createData(type, price, uid);
                          Navigator.pop(context);
                        }
                      },
                      elevation: 0,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'บันทึก',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Prompt',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    showDialog(context: context, child: dialog);
  }

  // void updateAlert(type, price) {
  //   AlertDialog dialog = new AlertDialog(
  //     content: new Container(
  //       width: 300.0,
  //       height: 300.0,
  //       child: new Column(
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: <Widget>[
  //           Expanded(
  //             child: Row(
  //               children: <Widget>[
  //                 Container(
  //                   decoration: BoxDecoration(
  //                     color: Colors.white,
  //                   ),
  //                   child: Text(
  //                     'รายการ',
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 18.0,
  //                       fontFamily: 'Prompt',
  //                     ),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Expanded(
  //             child: Container(
  //               child: TextFormField(
  //                 controller: _typeController,
  //                 onChanged: (String string) {
  //                   print('insert type done');
  //                   setState(() {
  //                     type = string;
  //                   });
  //                 },
  //                 decoration: InputDecoration(
  //                   filled: false,
  //                   contentPadding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                   hintText: 'รายการ',
  //                   hintStyle: TextStyle(
  //                     color: Colors.grey.shade500,
  //                     fontSize: 16,
  //                     fontFamily: 'Prompt',
  //                   ),
  //                   icon: Icon(Icons.local_grocery_store,
  //                       color: Colors.blue[900]),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             child: Container(
  //               child: TextFormField(
  //                 controller: _priceController,
  //                 onChanged: (String string) {
  //                   print('insert price done');
  //                   setState(() {
  //                     price = string;
  //                   });
  //                 },
  //                 keyboardType: TextInputType.number,
  //                 decoration: InputDecoration(
  //                   filled: false,
  //                   contentPadding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                   hintText: 'ราคา (บาท)',
  //                   hintStyle: TextStyle(
  //                     color: Colors.grey.shade500,
  //                     fontSize: 16,
  //                     fontFamily: 'Prompt',
  //                   ),
  //                   icon:
  //                       Icon(Icons.monetization_on, color: Colors.yellow[800]),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             child: Container(
  //               padding: EdgeInsets.all(16.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   RaisedButton(
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                     elevation: 0,
  //                     color: Colors.red,
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(50))),
  //                     child: Center(
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Text(
  //                             'ยกเลิก',
  //                             style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontFamily: 'Prompt',
  //                                 fontWeight: FontWeight.w400,
  //                                 fontSize: 16),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(width: 50),
  //                   RaisedButton(
  //                     onPressed: () async {
  //                       if (type == null && price == null) {
  //                         alert('Wrong', 'กรุณากรอกกรอกรายการ');
  //                       } else if (type == null) {
  //                         alert('Wrong', 'กรุณากรอกกรอกรายการ');
  //                       } else if (price == null) {
  //                         alert('Wrong', 'กรุณากรอกกรอกรายการ');
  //                       } else if (type != null && price != null) {
  //                         createData(type, price, uid);
  //                         Navigator.pop(context);
  //                       }
  //                     },
  //                     elevation: 0,
  //                     color: Colors.blue,
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(50))),
  //                     child: Center(
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Text(
  //                             'บันทึก',
  //                             style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontFamily: 'Prompt',
  //                                 fontWeight: FontWeight.w400,
  //                                 fontSize: 16),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );

  //   showDialog(context: context, child: dialog);
  // }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ListOfItems extends StatefulWidget {
  @override
  ListOfItemsState createState() => ListOfItemsState();
}

class ListOfItemsState extends State<ListOfItems> {
  String type, price;
  String uid;

  getType(type) {
    this.type = type;
    print(this.type);
  }

  getPrice(price) {
    this.price = price;
    print(this.price);
  }

  Future<void> getData() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    if (firebaseAuth.currentUser != null) {
      setState(() {
        uid = firebaseAuth.currentUser.uid;
      });
      print(firebaseAuth.currentUser.uid);
    }
  }

  // Future<void> createData() async {
  //   final databaseReference = Firestore.instance;

  //   Map<String, dynamic> map = Map();
  //   map['Type'] = type;
  //   map['Price'] = price;
  //   //await Firebase.initializeApp();
  //   await databaseReference
  //       .collection("Customer")
  //       .document()
  //       .collection("TypeOfClothes")
  //       .document()
  //       .setData(map)
  //       .then((value) {
  //     print('insert Successfully');
  //   });
  // }

  createData() {
    DocumentReference documentReference = Firestore.instance
        .collection("Customer")
        .document()
        .collection("TypeOfClothes")
        .document();

    Map<String, dynamic> typeofclothes = {"type": type, "price": price};

    documentReference.setData(typeofclothes).whenComplete(() {
      print("$type created");
    });
  }

  // readData() {
  //   Map<String, dynamic> typeofclothes = {"type": type, "price": price};
  //   DocumentReference documentReference = Firestore.instance
  //       .collection("Customer")
  //       .document()
  //       .collection("TypeOfClothes")
  //       .document();

  //   documentReference.get().then((datasnapshot) {
  //     print("$type read");
  //   });
  // }

  // updateData() {
  //   DocumentReference documentReference = Firestore.instance
  //       .collection("Customer")
  //       .document()
  //       .collection("TypeOfClothes")
  //       .document();

  //   Map<String, dynamic> typeofclothes = {"type": type, "price": price};

  //   documentReference.setData(typeofclothes).whenComplete(() {
  //     print("$type update");
  //   });
  // }

  // deleteData() {
  //   DocumentReference documentReference = Firestore.instance
  //       .collection("Customer")
  //       .document()
  //       .collection("TypeOfClothes")
  //       .document();

  //   Map<String, dynamic> typeofclothes = {"type": type, "price": price};

  //   documentReference.delete().whenComplete(() {
  //     print("$type delete");
  //   });
  // }

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
                  'เพิ่มรายการของร้าน',
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
                height: 550,
                child: SafeArea(
                  child: StreamBuilder(
                    stream: Firestore.instance
                        .collection("TypeOfClothes")
                        .snapshots(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot TypeOfClothes =
                              snapshot.data.documents[index];
                          return Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, top: 20),
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 30, left: 15),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/laundry-basket.png',
                                                height: 90,
                                                width: 90),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 30, left: 20),
                                          child: Text(
                                            TypeOfClothes.data()['Type'],
                                            style: TextStyle(
                                                color: Colors.blue[900],
                                                fontFamily: 'Prompt',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    TypeOfClothes.data()[
                                                        'Price'],
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
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            child: RaisedButton(
                                              elevation: 0,
                                              onPressed: () {
                                                // deleteData();
                                              },
                                              color: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50))),
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
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            child: RaisedButton(
                                              elevation: 0,
                                              onPressed: () {},
                                              color: Colors.green[800],
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50))),
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                child: TextField(
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
                child: TextField(
                  onChanged: (String string) {
                    price = string.trim();
                    print('insert price done');
                  },
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
                      onPressed: () {},
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
                      onPressed: () {
                        //insertinformation();
                        createData();
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

  // Future<void> insertinformation() async {
  //   final databaseReference = Firestore.instance;
  //   //Firestore firestore = Firestore.instance;

  //   Map<String, dynamic> map = Map();
  //   map['Type'] = type;
  //   map['Price'] = price;
  //   //await Firebase.initializeApp();
  //   await databaseReference
  //       .collection('TypeOfClothes')
  //       .document()
  //       .setData(map)
  //       .then((value) {
  //     print('insert Successfully');
  //   });
  // }

}

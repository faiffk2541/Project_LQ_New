import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/userpage/cart/addcart.dart';

import '../../navigationbar.dart';

class DetailServiceWashingPage extends StatefulWidget {
  final String laundryUID;
  DetailServiceWashingPage(this.laundryUID);

  @override
  DetailServiceWashingState createState() => DetailServiceWashingState();
}

class DetailServiceWashingState extends State<DetailServiceWashingPage> {
  List<int> sum = [];
  List<String> productID = [];
  List totalproduct = [];
  List amout = [];

  Map<String, dynamic> test = Map();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String type;
  int count = 0, price = 0, total = 0, count2 = 0;

  @override
  void initState() {
    super.initState();
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
                padding: EdgeInsets.only(top: 45, left: 15),
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
                  'รายการซักรีด',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontFamily: 'Prompt',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 500,
                child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection("Laundry")
                      .document(widget.laundryUID)
                      .collection("TypeOfService")
                      .document("typeofservice")
                      .collection("Washing")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return Text('Some Error');
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print('it can connect to firebase of service');
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot TypeOfService =
                                snapshot.data.documents[index];
                            print(TypeOfService.documentID);
                            return Stack(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          child: Image.asset(
                                              'assets/laundry-basket.png'),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              type =
                                                  TypeOfService.data()['Type'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Prompt',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              TypeOfService.data()['Price'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Prompt',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              children: <Widget>[
                                                InkWell(
                                                  onTap: () {
                                                    if (count != 0) {
                                                      setState(() {
                                                        if (!test.containsKey(
                                                            TypeOfService
                                                                .documentID)) {
                                                          count = test[
                                                              TypeOfService
                                                                  .documentID] = 1;
                                                        } else {
                                                          count = test[TypeOfService
                                                              .documentID] -= 1;
                                                        }
                                                        print(
                                                            'test2 ==>${test[TypeOfService.documentID]}');
                                                        productID.remove(
                                                            TypeOfService
                                                                .documentID);

                                                        totalproduct.remove({
                                                          "Type": TypeOfService
                                                                      .data()[
                                                                  'Type']
                                                              .toString(),
                                                          "Count": test[
                                                              TypeOfService
                                                                  .documentID],
                                                        });

                                                        sum.remove(int.parse(
                                                            TypeOfService
                                                                    .data()[
                                                                'Price']));

                                                        total = sum.reduce(
                                                            (value, element) =>
                                                                value +
                                                                element);

                                                        print(
                                                            'object ==> $totalproduct');
                                                        print(
                                                            'uid  ==> $productID');
                                                        print(sum);
                                                        print(
                                                            'price ==> ${TypeOfService.data()['Price']}');
                                                        print('sum ==> $sum');
                                                        print(
                                                            'count ==> $count');
                                                        print(
                                                            'total ==> $total');
                                                      });
                                                    }
                                                  },
                                                  child: Image.asset(
                                                      'assets/minus.png',
                                                      width: 30,
                                                      height: 30),
                                                ),
                                                SizedBox(width: 20),
                                                Text(
                                                  test[TypeOfService
                                                              .documentID] !=
                                                          null
                                                      ? "${test[TypeOfService.documentID]}"
                                                      : 0.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Prompt',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                SizedBox(width: 20),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (!test.containsKey(
                                                          TypeOfService
                                                              .documentID)) {
                                                        count = test[
                                                            TypeOfService
                                                                .documentID] = 1;
                                                      } else {
                                                        count = test[TypeOfService
                                                            .documentID] += 1;
                                                      }
                                                      print(
                                                          'test2 ==>${test[TypeOfService.documentID]}');

                                                      productID.add(
                                                          TypeOfService
                                                              .documentID);

                                                      totalproduct.add({
                                                        "Type": TypeOfService
                                                                .data()['Type']
                                                            .toString(),
                                                        "Count": test[
                                                            TypeOfService
                                                                .documentID],
                                                      });

                                                      print('map ==> $test');
                                                      sum.add(int.parse(
                                                          TypeOfService.data()[
                                                              'Price']));
                                                      TypeOfService.data()[
                                                          'Type'];
                                                      total = sum.reduce(
                                                          (value, element) =>
                                                              value + element);
                                                      print(
                                                          'object ==> $totalproduct');

                                                      print(
                                                          'uid ==> $productID');
                                                      print(sum);

                                                      print(
                                                          'price ==> ${TypeOfService.data()['Price']}');
                                                      print('sum  ==> $sum');
                                                      print('count ==> $count');
                                                      print('total ==> $total');
                                                    });
                                                  },
                                                  child: Image.asset(
                                                      'assets/add.png',
                                                      width: 30,
                                                      height: 30),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    }
                  },
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 15),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "รวมทั้งหมด",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Prompt',
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "$total  บาท",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Prompt',
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          "ยืนยัน",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontFamily: 'Prompt',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    AlertDialog dialog = new AlertDialog(
      title: Center(
        child: Text(
          "ยืนยันการทำรายการ",
          style: TextStyle(
              color: Colors.red,
              fontFamily: 'Prompt',
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),
      content: new Container(
        height: 50,
        child: new Column(
          children: <Widget>[
            Container(
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
                  SizedBox(width: 30),
                  RaisedButton(
                    onPressed: () {
                      insertinformation();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationBarPage()),
                      );
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
                            'ตกลง',
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
          ],
        ),
      ),
    );
    showDialog(context: context, child: dialog);
  }

  Future<void> insertinformation() async {
    final databaseReference = Firestore.instance;

    Map<String, dynamic> map = Map();
    map['CustomerID'] = firebaseAuth.currentUser.uid;
    map['LuandryID'] = widget.laundryUID;
    map['Total'] = total;

    await databaseReference
        .collection('Order')
        .document(firebaseAuth.currentUser.uid)
        .setData(map)
        .then((value) {
      print('insert Successfully');
    });
    Map<String, dynamic> service = Map();
    service['order'] = totalproduct;

    await databaseReference
        .collection("Order")
        .document(firebaseAuth.currentUser.uid)
        .collection("TypeOfService")
        .document("typeofservice")
        .collection("Washing")
        .document()
        .setData(service)
        .then((value) {
      print('insert service Successfully');
    });
  }
}

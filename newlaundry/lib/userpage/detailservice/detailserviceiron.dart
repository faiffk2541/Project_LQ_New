import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/userpage/cart/addcart.dart';
import 'dart:math';

import '../../navigationbar.dart';

class DetailServiceIronPage extends StatefulWidget {
  final String laundryUID;

  DetailServiceIronPage(this.laundryUID);
  @override
  DetailServiceIronState createState() => DetailServiceIronState();
}

class DetailServiceIronState extends State<DetailServiceIronPage> {
  List<int> sum = [];
  List<String> productID = [];
  //add this valuse
  List totalproduct = [];
  List typeofproductList = [];
  Set typeofproduct = new Set();
  List<dynamic> totalproductList=[];
  List<dynamic> sumtotal = [];

  var choose = Map();
  var order = new Map();

  
  String type;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
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
                  'รายการรีด',
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
                child: StreamBuilder(
                    stream: Firestore.instance
                        .collection("Laundry")
                        .document(widget.laundryUID)
                        .collection("TypeOfService")
                        .document("typeofservice")
                        .collection("Iron")
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
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
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
                                            children: [
                                              Text(
                                                TypeOfService.data()['Type'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Prompt',
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                TypeOfService.data()['Price'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Prompt',
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      if (count != 0) {
                                                        setState(() {
                                                          if (!choose.containsKey(
                                                              TypeOfService
                                                                  .documentID)) {
                                                            count = choose[
                                                                TypeOfService
                                                                    .documentID] = 1;
                                                          } else {
                                                            count = choose[
                                                                TypeOfService
                                                                    .documentID] -= 1;
                                                          }
                                                          print('test2 ==>${choose[TypeOfService.documentID]}');
                                                          typeofproduct.add(TypeOfService.data()['Type'].toString());
                                                          print(typeofproduct.toList());  

                                                          print('sumtotal ==> $sumtotal');
                                                          sumtotal.removeLast(
                                                            // TypeOfService.data()['Type']
                                                            //  count, 
                                                            //  int.parse(TypeOfService.data()['Price'])                                                                           
                                                          );
                                                          //print('sumtotal ==> $sumtotal');
                                                          
                                                        // add this code for delect order but it cannot work now
                                                        //List totalproductList =[];
                                                        // List totalproductList = [];
                                                        // List typeofproductList = typeofproduct.toList();
                                                        // for (var i = 0; i < typeofproductList.length; i++) {
                                                        //    List temp = [];
                                                        //    List price = [];
                                                        //     for (var j = 0; j < sumtotal.length; j++) {
                                                        //       if (sumtotal[j]["Type"] == TypeOfService.data()['Type'].toString()) {                                                                 
                                                        //         temp.add(sumtotal[j]["Count"]);
                                                        //         price.add(sumtotal[j]["Price"]);
                                                        //         //temp.removeLast();
                                                                
                                                        //       }
                                                        //     }
                                                        //     totalproductList.add({
                                                        //           "Type": typeofproductList[i],
                                                        //           "Count": temp.length-1,
                                                        //           "Price": price                                                                                                                                                                                      
                                                        //         });
                                                            
                                                        // }
                                                            //sumtotal = totalproductList.toList();
                                                            print('sumtotal ==> $sumtotal');
                                                            print('typeofproductList ==> $typeofproductList');
                                                            //print('temp ==> $temp');
                                                            print('totalproduct ==> $totalproduct');

                                                        print('totalproductList ==>$totalproductList');
                                                          sum.remove(int.parse(TypeOfService.data()['Price']));
                                                          total = sum.reduce((value, element) => value + element);
                                                                
                                                          print('sum ==> $sum');
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
                                                    choose[TypeOfService
                                                                .documentID] != null                                                            
                                                        ? "${choose[TypeOfService.documentID]}"
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
                                                        if (!choose.containsKey(TypeOfService.documentID)) {                                                            
                                                                
                                                          count = choose[
                                                              TypeOfService
                                                                  .documentID] = 1;
                                                        } else {
                                                          count = choose[
                                                              TypeOfService
                                                                  .documentID] += 1;
                                                        }
                                                        print('test2 ==>${choose[TypeOfService.documentID]}'); 
                                                                                                                  
                                                        //add this code for add orders
                                                        typeofproduct.add(TypeOfService.data()['Type'].toString());     
                                                        totalproduct.add({
                                                          "Type": TypeOfService.data()['Type'].toString(),
                                                          "Count": count, 
                                                          "Price": int.parse(TypeOfService.data()['Price'])                                                                                                                               
                                                        });
                                                        print(typeofproduct.toList());                                                       
                                                      List totalproductList =[];
                                                      typeofproductList = typeofproduct.toList();
                                                        for (var i = 0; i < typeofproductList.length; i++) {
                                                          List temp = [];
                                                          List price = [];
                                                            for (var j = 0; j < totalproduct.length; j++) {
                                                              if (totalproduct[j]["Type"] == typeofproductList[i]) {
                                                                temp.add(totalproduct[j]["Count"]);
                                                                price.add(totalproduct[j]["Price"]);
                                                              }
                                                            }
                                                            totalproductList.add({
                                                              "Type": typeofproductList[i],
                                                              "Count": temp.reduce((curr, next) => curr > next? curr: next),
                                                              "Price": price.reduce((value, element) => value + element)                                                                                                                                                                                           
                                                             });
                                                          
                                                        }
                                                        sumtotal = totalproductList.toList();
                                                        print('sumtotal ==>$sumtotal');
                                                        print('totalproductList ==> $totalproductList');
                                                        print('totalproduct ==> $totalproduct');
                                                        print(totalproduct[totalproduct.length-1]);                                                                                                                                                                                                                       
                                                            
                                                        sum.add(int.parse(TypeOfService.data()[ 'Price']));                                                                                                                                                                                             
                                                        TypeOfService.data()['Type'];
                                                            
                                                        total = sum.reduce((value, element) => value + element);                                                                
                                                        print('sum ==> $sum');
                                                        print(
                                                            'total ==> $total');
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
                    }),
              ),
              SizedBox(height: 30),
              Row(
                children: [
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
                          "$total บาท",
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

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => AddCartPage()),
                          // );
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
    //map['Type'] = productID;
    map['Total'] = total;
    //map['Count'] = count;

    await databaseReference
        .collection('Order')
        .document(firebaseAuth.currentUser.uid)
        .setData(map)
        .then((value) {
      print('insert Successfully');
    });
    Map<String, dynamic> service = Map();

    service['order'] = sumtotal;
    // service['Type'] = type;
    // service['Count'] = count;

    await databaseReference
        .collection("Order")
        .document(firebaseAuth.currentUser.uid)
        .collection("TypeOfService")
        .document("typeofservice")
        .collection("Iron")
        .document()
        .setData(service)
        .then((value) {
      print('sumtotal == $sumtotal');
      print('insert service Successfully');
    });
  }
}

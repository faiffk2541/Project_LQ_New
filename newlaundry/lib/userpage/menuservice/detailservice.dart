import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/userpage/cart/addcart.dart';
import 'package:newlaundry/userpage/menu/menuservice.dart';

class DetailServicePage extends StatefulWidget {
  @override
  DetailServiceState createState() => DetailServiceState();
}

class DetailServiceState extends State<DetailServicePage> {
  int count = 0;

  void add() {
    setState(() {
      count++;
    });
  }

  void minus() {
    setState(() {
      if (count != 0) count--;
    });
  }
  // String type, price;

  // getType(type) {
  //   this.type = type;
  //   print(this.type);
  // }

  // getPrice(price) {
  //   this.price = price;
  //   print(this.price);
  // }

  //use code
  // createData() {
  //   DocumentReference documentReference = Firestore.instance
  //       .collection("Customer")
  //       .document()
  //       .collection("TypeOfClothes")
  //       .document();

  //   Map<String, dynamic> typeofclothes = {"type": type, "price": price};

  //   documentReference.setData(typeofclothes).whenComplete(() {
  //     print("$type created");
  //   });
  // }

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenuServicePage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  'รายการ',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontFamily: 'Prompt',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: Image.asset('assets/laundry-basket.png'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40),
                          child: Column(
                            children: [
                              Text(
                                'เสื้อ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 15),
                              Text(
                                '25 บาท',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      minus();
                                    },
                                    child: Image.asset('assets/minus.png',
                                        width: 30, height: 30),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    '$count',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Prompt',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(width: 20),
                                  InkWell(
                                    onTap: () {
                                      add();
                                    },
                                    child: Image.asset('assets/add.png',
                                        width: 30, height: 30),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
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
                          "100 บาท",
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
                          "ใส่ตระกร้า",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontFamily: 'Prompt',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddCartPage()),
                          );
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
}

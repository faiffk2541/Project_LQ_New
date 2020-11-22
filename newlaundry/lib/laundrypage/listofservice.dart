import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/laundrypage/listofitems/listofitemsfold.dart';
import 'package:newlaundry/laundrypage/listofitems/listofitemsiron.dart';
import 'package:newlaundry/laundrypage/listofitems/listofitemswashing.dart';

class ListOfService extends StatefulWidget {
  @override
  ListOfServiceState createState() => ListOfServiceState();
}

class ListOfServiceState extends State<ListOfService> {
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
                  'บริการของร้าน',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontFamily: 'Prompt',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: double.maxFinite,
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListOfItemsWashing()),
                    ),
                  },
                  child: Card(
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.redAccent[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 90,
                            height: 90,
                            child: Center(
                              child: Image.asset(
                                'assets/washing.png',
                                height: 70,
                                width: 70,
                              ),
                            ),
                          ),
                          Container(
                              child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('บริการซักรีด',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18)),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: double.maxFinite,
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListOfItemsFold()),
                    ),
                  },
                  child: Card(
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 90,
                            height: 90,
                            child: Center(
                              child: Image.asset(
                                'assets/towels.png',
                                height: 70,
                                width: 70,
                              ),
                            ),
                          ),
                          Container(
                              child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('บริการซักพับ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18)),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: double.maxFinite,
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListOfItemsIron()),
                    ),
                  },
                  child: Card(
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 90,
                            height: 90,
                            child: Center(
                              child: Image.asset(
                                'assets/iron.png',
                                height: 70,
                                width: 70,
                              ),
                            ),
                          ),
                          Container(
                              child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('บริการรีด',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18)),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

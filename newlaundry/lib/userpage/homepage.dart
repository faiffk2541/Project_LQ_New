import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/userpage/menu/menudetail.dart';

class HomePage extends StatefulWidget {
  final String customerFname, customerID;
  HomePage(this.customerFname, this.customerID);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController SearchController = TextEditingController();
  String searchString;
  final firestore = Firestore.instance;
  List<DocumentSnapshot> laundry = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60, left: 15, right: 15),
                  height: 50,
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    child: TextField(
                      autofocus: true,
                      onChanged: (val) {
                        setState(() {
                          searchString = val.toLowerCase();
                        });
                      },
                      controller: SearchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.grey,
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Prompt',
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: (searchString == null || searchString.trim() == '')
                        ? Firestore.instance.collection('Laundry').snapshots()
                        : Firestore.instance
                            .collection('Laundry')
                            .where('searchIndex', arrayContains: searchString)
                            .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('We got an Error ${snapshot.error}');
                      }
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Loading . .',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                          );
                        case ConnectionState.none:
                          return Text('Oops! No data present',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300));
                        case ConnectionState.done:
                          return Text('We are done',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300));
                        default:
                          return new ListView(
                              children: snapshot.data.documents.map(
                            (DocumentSnapshot laundry) {
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 60, right: 60, bottom: 10),
                                    width: double.maxFinite,
                                    child: InkWell(
                                      onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MenuDetailPage(
                                                      laundry.documentID,
                                                      laundry.data()['Address'],
                                                      laundry.data()['Name'],
                                                      laundry.data()['Phone'],
                                                      laundry.data()['Time'],
                                                      laundry.data()['URLpic'],
                                                      widget.customerFname,
                                                      widget.customerID)),
                                        ),
                                      },
                                      child: Card(
                                        child: Container(
                                          height: 190,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Column(
                                              children: [
                                                Center(
                                                  child: Image.network(
                                                      laundry.data()['URLpic'],
                                                      width: 100,
                                                      height: 100),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  child: Center(
                                                    child: Text(
                                                      laundry.data()['Name'],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Prompt',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/phone-call.png',
                                                        width: 15,
                                                        height: 15,
                                                      ),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        laundry.data()['Phone'],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Prompt',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Container(
                                                //   margin:
                                                //       EdgeInsets.only(top: 5),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment
                                                //             .center,
                                                //     children: [
                                                //       Image.asset(
                                                //         'assets/start.png',
                                                //         width: 15,
                                                //         height: 15,
                                                //       ),
                                                //       Text(
                                                //         laundry.data()['Time'],
                                                //         style: TextStyle(
                                                //             color: Colors.black,
                                                //             fontFamily:
                                                //                 'Prompt',
                                                //             fontSize: 16,
                                                //             fontWeight:
                                                //                 FontWeight
                                                //                     .w300),
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).toList());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

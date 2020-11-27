import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/userpage/menu/menudetail.dart';
import 'package:newlaundry/widgets/searchpage.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController SearchController = TextEditingController();
  String searchString;
  final firestore = Firestore.instance;
  List<DocumentSnapshot> laundry = [];

  getLaundry() async {
    Query q = firestore.collection("Laundry");

    QuerySnapshot querySnapshot = await q.getDocuments();
    laundry = querySnapshot.documents;
  }

  @override
  void initState() {
    super.initState();
    getLaundry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                // Padding(
                //   padding: EdgeInsets.only(top: 15, left: 15),
                //   child: Container(
                //     child: TextField(
                //       autofocus: true,
                //       onChanged: (val) {
                //         setState(() {
                //           searchString = val.toLowerCase();
                //         });
                //       },
                //       controller: SearchController,
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         icon: Icon(Icons.search),
                //         hintText: 'Search',
                //         hintStyle: TextStyle(
                //             color: Colors.grey,
                //             fontFamily: 'Prompt',
                //             fontSize: 18,
                //             fontWeight: FontWeight.w300),
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 50, left: 15, right: 15),
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
                          return Text('Loading . .');
                        case ConnectionState.none:
                          return Text('Oops! No data present');
                        case ConnectionState.done:
                          return Text('We are done');
                        default:
                          return new ListView(
                              children: snapshot.data.documents.map(
                            (DocumentSnapshot laundry) {
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 40, right: 40, bottom: 10),
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
                                                      laundry
                                                          .data()['URLpic'])),
                                        ),
                                      },
                                      child: Card(
                                        child: Container(
                                          height: 210,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Column(
                                              children: [
                                                Center(
                                                  child: Image.network(
                                                      laundry.data()['URLpic'],
                                                      width: 90,
                                                      height: 90),
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
                                                      SizedBox(width: 5),
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
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/start.png',
                                                        width: 15,
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        ' 20 รีวิว',
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

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 50, left: 15, right: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Prompt',
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    // child: TextField(
                    //   decoration: InputDecoration(
                    //       enabledBorder: InputBorder.none,
                    //       focusedBorder: InputBorder.none,
                    //       icon: Icon(Icons.search, size: 30, color: Colors.grey),
                    //       hintText: 'Search',
                    //       hintStyle: TextStyle(
                    //           color: Colors.grey,
                    //           fontFamily: 'Prompt',
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.w300)),
                    // ),
                  ),
                ),
              ),
              Container(
                height: 700,
                margin: EdgeInsets.only(left: 5, right: 5),
                child: StreamBuilder(
                  stream: Firestore.instance.collection("Laundry").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print('it can connect to firebase');
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot Laundry =
                              snapshot.data.documents[index];
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
                                          builder: (context) => MenuDetailPage(
                                              laundry[index].documentID,
                                              laundry[index].data()['Address'],
                                              laundry[index].data()['Name'],
                                              laundry[index].data()['Phone'],
                                              laundry[index].data()['Time'],
                                              laundry[index].data()['URLpic'])),
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
                                                  Laundry.data()['URLpic'],
                                                  width: 90,
                                                  height: 90),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Center(
                                                child: Text(
                                                  Laundry.data()['Name'],
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
                                              margin: EdgeInsets.only(top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/phone-call.png',
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    Laundry.data()['Phone'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Prompt',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                        fontFamily: 'Prompt',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w300),
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
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

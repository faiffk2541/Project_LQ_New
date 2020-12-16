import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'userpage/historypage.dart';
import 'userpage/homepage.dart';
import 'userpage/notificationpage.dart';
import 'userpage/profilepage.dart';

class NavigationBarPage extends StatefulWidget {
  @override
  NavigationBarPageState createState() => NavigationBarPageState();
}

class NavigationBarPageState extends State<NavigationBarPage> {
  int _currentIndex = 0;
  String customerFname, customerID;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<Null> getData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        String customerUID = event.uid;

        DocumentReference querySnapshot =
            await Firestore.instance.collection("Customer").doc(customerUID);
        DocumentSnapshot snap = await Firestore.instance
            .collection("Customer")
            .doc(customerUID)
            .get();
        await Firestore.instance
            .collection('Customer')
            .doc(customerUID)
            .snapshots()
            .listen((event) {
          setState(() {
            customerFname = snap.data()["Fname"].toString();
            customerID = snap.data()["CustomerID"].toString();
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _pageActive = [
      HomePage(customerFname, firebaseAuth.currentUser.uid),
      HistoryPage(firebaseAuth.currentUser.uid),
      NotificationPage(),
      ProfilePage(firebaseAuth.currentUser.uid),
    ];
    return Scaffold(
      body: _pageActive[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.history, size: 30, color: Colors.white),
          Icon(Icons.notifications_active, size: 30, color: Colors.white),
          Icon(Icons.perm_identity, size: 30, color: Colors.white),
        ],
        color: Colors.blue,
        backgroundColor: Colors.blue[100],
        buttonBackgroundColor: Colors.blue,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/laundrypage/editinformationlaundry.dart';

class DataLaundry extends StatefulWidget {
  @override
  DataLaundryState createState() => DataLaundryState();
}

class DataLaundryState extends State<DataLaundry> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String urlPic, name, time, phone, address;

  @override
  void initState() {
    super.initState();
    // getData();
  }

  Future<Null> getData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        String uid = event.uid;
        print("uid of user   ===> $uid");

        DocumentReference querySnapshot =
            await Firestore.instance.collection("Laundry").doc(uid);
        DocumentSnapshot snap =
            await Firestore.instance.collection("Laundry").doc(uid).get();
        print(snap.data()["Address"].toString());
        print(snap.data()["Name"].toString());
        print(snap.data()["Phone"].toString());
        print(snap.data()["Time"].toString());
        await Firestore.instance
            .collection('Laundry')
            .doc(uid)
            .snapshots()
            .listen((event) {
          setState(() {
            address = snap.data()["Address"].toString();
            name = snap.data()["Name"].toString();
            phone = snap.data()["Phone"].toString();
            time = snap.data()["Time"].toString();
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
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
              'ข้อมูลร้าน',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Prompt',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Center(
                    child: Image.network('$urlPic', width: 150, height: 150),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'ชื่อร้าน',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$name',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'เปิด - ปิด',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$time',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'ที่อยู่ร้าน',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$address',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'เบอร์โทร',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$phone',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditInformationLaundry(
                      name: name,
                      time: time,
                      address: address,
                      phone: phone,
                    )),
          ).then((value) => getData());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

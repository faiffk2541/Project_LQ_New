import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/navigationbar.dart';
import 'package:newlaundry/userpage/homepage.dart';
import 'package:newlaundry/widgets/google_signin.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:newlaundry/userpage/menu/menuservice.dart';
import 'package:path/path.dart' as Path;

class MenuDetailPage extends StatefulWidget {
  final String address, name, phone, time, urlPic;

  MenuDetailPage(@required this.address, @required this.name,
      @required this.phone, @required this.time, @required this.urlPic);

  @override
  MenuDetailState createState() => MenuDetailState();
}

class MenuDetailState extends State<MenuDetailPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Future<Null> getData() async {
  //   await Firebase.initializeApp().then((value) async {
  //     await FirebaseAuth.instance.authStateChanges().listen((event) async {
  //       String uid = event.uid;
  //       print("uid of user   ===> $uid");

  //       DocumentReference querySnapshot =
  //           await Firestore.instance.collection("Laundry").doc(uid);
  //       DocumentSnapshot snap =
  //           await Firestore.instance.collection("Laundry").doc(uid).get();
  //       print(snap.data()["Address"].toString());
  //       print(snap.data()["Name"].toString());
  //       print(snap.data()["Phone"].toString());
  //       print(snap.data()["Time"].toString());
  //       print(snap.data()["URLpic"].toString());
  //       await Firestore.instance
  //           .collection('Laundry')
  //           .doc(uid)
  //           .snapshots()
  //           .listen((event) {
  //         setState(() {
  //           address = snap.data()["Address"].toString();
  //           name = snap.data()["Fname"].toString();
  //           phone = snap.data()["Phone"].toString();
  //           time = snap.data()["Email"].toString();
  //           urlPic = snap.data()["Email"].toString();
  //         });
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationBarPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 25),
            child: Center(
              child: Container(
                height: 250,
                width: 350,
                child: Center(
                  child: Image.asset('assets/shop1.png'),
                  // child: Image.network(widget.urlPic),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: Container(
                child: Column(
                  children: [
                    shopLocation(name: "พิกัด"),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prompt',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                SmoothStarRating(
                                  color: Colors.yellow[700],
                                  rating: 4,
                                  borderColor: Colors.yellow[700],
                                  size: 20,
                                ),
                                SizedBox(height: 10, width: 15),
                                Text(
                                  '(20 รีวิว)',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Prompt',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.access_time),
                        SizedBox(height: 10, width: 10),
                        Flexible(
                          child: Text(
                            widget.time,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.home),
                        SizedBox(height: 10, width: 10),
                        Flexible(
                          child: Text(
                            widget.address,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(height: 10, width: 10),
                        Flexible(
                          child: Text(
                            widget.phone,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 30),
            child: Container(
              width: 120,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuServicePage()),
                  );
                },
                padding: EdgeInsets.all(10),
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'เลือกบริการ',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontFamily: 'Prompt',
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<Widget> check(String urlPic) async {
    //uploadPicToStorage();
    var fileUrl = Uri.decodeFull(Path.basename(urlPic))
        .replaceAll(new RegExp(r'(\?alt).*'), '');
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileUrl);
    await firebaseStorageRef.getDownloadURL();
  }
}

Row shopLocation({String name}) {
  return Row(
    children: [
      Icon(
        Icons.location_on,
        color: Colors.grey,
      ),
      SizedBox(width: 10, height: 10),
      Text(
        'location',
        style: TextStyle(
            height: 1.5,
            color: Colors.black,
            fontFamily: 'Prompt',
            fontSize: 16,
            fontWeight: FontWeight.w300),
      )
    ],
  );
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:newlaundry/widgets/commentpage.dart';
import 'package:newlaundry/userpage/menu/menuservice.dart';
import 'package:path/path.dart' as Path;

class MenuDetailPage extends StatefulWidget {
  final String laundryID, address, name, phone, time, urlPic;
  final String customerFname, customerID;

  MenuDetailPage(this.laundryID, this.address, this.name, this.phone, this.time,
      this.urlPic, this.customerFname, this.customerID);

  @override
  MenuDetailState createState() => MenuDetailState();
}

class MenuDetailState extends State<MenuDetailPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 25),
            child: Center(
              child: Container(
                child: Center(
                  child: widget.urlPic == "null"
                      ? Image.asset(
                          'assets/shop1.png',
                          width: 350,
                          height: 250,
                        )
                      : Image.network(widget.urlPic, width: 350, height: 250),
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
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Container(
              height: 70,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Row(
                        children: [
                          Text(
                            'ความคิดเห็น',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CommentPage(widget.laundryID)),
                                );
                              },
                              child: new Text(
                                "ดูทั้งหมด",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: Colors.grey, size: 15)
                        ],
                      ),
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
                    MaterialPageRoute(
                        builder: (context) => MenuServicePage(widget.laundryID,
                            widget.name, widget.customerFname)),
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

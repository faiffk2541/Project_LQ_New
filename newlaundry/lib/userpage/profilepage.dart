import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/laundrypage/profilelaundry.dart';
import 'package:newlaundry/signinpage/signinpage.dart';
import 'package:newlaundry/userpage/profileuser/accountpage.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  ProfilePage(this.uid);
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  String login;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 120,
                  height: 40,
                  child: RaisedButton(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                    child: Center(
                      child: Text(
                        'ร้านค้าของฉัน',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileLaundry(widget.uid)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: SizedBox(
                          // width: 100,
                          // height: 100,
                          child: Image.asset(
                            'assets/boy.png',
                            fit: BoxFit.fill,
                          ),
                          // child: Image.asset(
                          //   imageUrl,
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      firebaseAuth.currentUser.email,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Prompt',
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 10, right: 10),
            width: double.maxFinite,
            child: InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountPage()),
                ),
              },
              child: Card(
                child: Container(
                  height: 80,
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.perm_contact_calendar,
                        color: Colors.blue,
                        size: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                      ),
                      Text(
                        "บัญชีของฉัน",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 80),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.only(left: 100, right: 100),
            width: double.maxFinite,
            child: InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                )
              },
              child: Card(
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "ออกจากระบบ",
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

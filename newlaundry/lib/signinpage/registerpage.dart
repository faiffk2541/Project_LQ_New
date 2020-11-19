import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newlaundry/navigationbar.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  String fname;
  String lname;
  String email;
  String password;

  final firestore = Firestore.instance;

  Future<void> insertinformation(String email, name, lname) async {
    final databaseReference = Firestore.instance;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    Map<String, dynamic> map = Map();
    map['Email'] = email;
    map['URLpic'] = "";
    map['Fname'] = name;
    map['Lname'] = lname;
    map['Birthday'] = "";
    map['Sex'] = "";
    map['Phone'] = "";
    map['Address'] = "";

    try {
      await databaseReference
          .collection("Customer")
          .document(firebaseAuth.currentUser.uid)
          .setData(map)
          .then((value) {
        print('insert email Successfully');
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((response) {
      print('Register Success for Email = $email');
      print('Register Success for FName = $fname');
      print('Register Success for LName = $lname');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NavigationBarPage()));
      insertinformation(email, fname, lname);
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title = $title, message = $message');
      myAlert(title, message);
    });
  }

  void myAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: ListTile(
            leading: Icon(
              Icons.add_alarm,
              color: Colors.red,
              size: 40,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          content: Text(message),
          actions: [
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: ListView(
        children: <Widget>[
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
          SizedBox(height: 50),
          Container(
            child: Center(
              child: Image.asset(
                'assets/pin.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            child: Center(
              child: Text(
                'LAUNDRY',
                style: TextStyle(
                    color: Colors.blue[900],
                    fontFamily: 'Prompt',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 330,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        hintText: "ชื่อสมาชิก",
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey[100],
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 16,
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'กรุณากรอกชื่อ';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String value) {
                        fname = value.trim();
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 330,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        hintText: "นามสกุล",
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey[100],
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 16,
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'กรุณากรอกนามสกุล';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String value) {
                        lname = value.trim();
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 330,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        hintText: "อีเมล์",
                        icon: Icon(
                          Icons.email,
                          color: Colors.grey[100],
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 16,
                      ),
                      validator: (String value) {
                        if (!((value.contains('@')) && (value.contains('.')))) {
                          return 'กรุณากรอกอีเมล์';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String value) {
                        email = value.trim();
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 330,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      autocorrect: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        hintText: "รหัสผ่าน",
                        icon: Icon(
                          Icons.lock,
                          color: Colors.grey[100],
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Prompt',
                        fontSize: 16,
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'กรุณากรอกรหัสผ่าน';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String value) {
                        password = value.trim();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 70),
          Center(
            child: Container(
              width: 250,
              child: RaisedButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    print(
                        'fname = $fname, lname = $lname ,email =$email, password = $password');
                    registerThread(); //ถ้าเมื่อไรที่ได้ค่า name email pass ให้ไปทำงานที่  registerThread()
                  }
                },
                padding: EdgeInsets.all(10),
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'สมัครสมาชิก',
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
}

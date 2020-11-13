import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:newlaundry/date_picker/date_textbox.dart';

class AccountPage extends StatefulWidget {
  @override
  AccountPageState createState() => AccountPageState();
}

enum SingingCharacter { male, female, notspecified }

class AccountPageState extends State<AccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File imageFile, file;
  var imageFiles = [];
  String login;
  String urlPic, fname, lname, birthday, sex, phone, address;
  SingingCharacter _character = SingingCharacter.notspecified;

  @override
  void initState() {
    super.initState();
    findDisplay();
  }

  _openGallary(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(ImageSource imageSource) async {
    var picture = await ImagePicker.pickImage(source: imageSource);
    setState(() {
      imageFile = picture;
      this.imageFiles.add(picture);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'ดำเนินการ',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Prompt',
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'รูปภาพ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Prompt',
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      _openGallary(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  GestureDetector(
                    child: Text(
                      'ถ่ายภาพ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Prompt',
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      _openCamera(ImageSource.camera);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  GestureDetector(
                    child: Text(
                      'ลบรูปปัจจุบัน',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Prompt',
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> findDisplay() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    if (firebaseAuth.currentUser != null) {
      setState(() {
        login = firebaseAuth.currentUser.email;
      });
    }
  }

  DateTime _selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final birthdayTile = new Material(
      color: Colors.transparent,
      textStyle: TextStyle(
          fontFamily: 'Prompt', fontSize: 16, fontWeight: FontWeight.w400),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CupertinoDateTextBox(
            initialValue: _selectedDateTime,
            onDateChange: onBirthdayChange,
            hintText: DateFormat.yMd().format(_selectedDateTime),
            fontSize: 20,
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
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
              'บัญชีของฉัน',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Prompt',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 50),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/boy.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: Container(
                        height: 35,
                        width: 35,
                        child: IconButton(
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 20,
                          ),
                          onPressed: () {
                            _showChoiceDialog(context);
                          },
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          'ชื่อ',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontFamily: 'Prompt',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          ' **',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Prompt',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )),
                TextField(
                  onChanged: (String string) {
                    fname = string.trim();
                    print('insert name done');
                  },
                  style: TextStyle(
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ชื่อ',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Prompt',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'นามสกุล',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        ' **',
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                TextField(
                  onChanged: (String string) {
                    lname = string.trim();
                    print('insert name done');
                  },
                  style: TextStyle(
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'นามสกุล',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Prompt',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'อีเมล์',
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
                  '$login',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          //SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'วันเกิด',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        ' **',
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    birthdayTile,
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                      ),
                      Text(
                        'เพศ',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        ' **',
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Radio(
                      value: SingingCharacter.male,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    Text(
                      'ชาย',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Prompt',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 20),
                    new Radio(
                      value: SingingCharacter.female,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    Text(
                      'หญิง',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Prompt',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 20),
                    new Radio(
                      value: SingingCharacter.notspecified,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    Text(
                      'ไม่ระบุ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Prompt',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 100,
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
                      Text(
                        ' **',
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Prompt',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                TextField(
                  onChanged: (String string) {
                    phone = string.trim();
                    print('insert name done');
                  },
                  style: TextStyle(
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  keyboardType: TextInputType.number,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'เบอร์โทร',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Prompt',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          'ที่อยู่',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontFamily: 'Prompt',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          ' **',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Prompt',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )),
                TextField(
                  onChanged: (String string) {
                    address = string.trim();
                    print('insert name done');
                  },
                  style: TextStyle(
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ที่อยู่',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Prompt',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'ยกเลิก',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 65),
                Column(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        insertinformation();
                      },
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'บันทึก',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: 'Prompt',
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }

  Future<void> insertinformation() async {
    final databaseReference = Firestore.instance;
    //Firestore firestore = Firestore.instance;

    Map<String, dynamic> map = Map();
    map['URLpic'] = urlPic;
    map['Fname'] = fname;
    map['Lname'] = lname;
    map['Birthday'] = birthday;
    map['Sex'] = sex;
    map['Phone'] = phone;
    map['Adress'] = address;
    //await Firebase.initializeApp();
    await databaseReference
        .collection('Customer')
        .document()
        .setData(map)
        .then((value) {
      print('insert Successfully');
    });
  }

  //   Future<void> uploadPicToStorage() async {
  //   Random random = Random();
  //   int i = random.nextInt(100000);

  //   FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  //   StorageReference storageReference =
  //       firebaseStorage.ref().child('PicInformationelaundry/inforlaunry$i.jpg');
  //   StorageUploadTask storageUploadTask = storageReference.putFile(imageFile);

  //   urlPic = await (await storageUploadTask.onComplete).ref.getDownloadURL();
  //   print('urlPic is = $urlPic');
  //   insertinformation();
  // }
}

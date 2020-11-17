import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newlaundry/date_picker/date_textbox.dart';
import 'package:newlaundry/widgets/google_signin.dart';

class EditAccount extends StatefulWidget {
  final Map model;
  EditAccount({Key key, this.model}) : super(key: key);
  @override
  EditAccountState createState() => EditAccountState();
}

enum SingingCharacter { male, female, notspecified }

class EditAccountState extends State<EditAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String urlPic, fname, lname, birthday, sex, phone, address;
  File imageFile, file;
  var imageFiles = [];
  DateTime _selectedDateTime = DateTime.now();
  SingingCharacter _character = SingingCharacter.notspecified;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Map map;

  @override
  void initState() {
    super.initState();
    map = widget.model;
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
      },
    );
  }

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[100],
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: IconButton(
            icon: Icon(Icons.close, size: 30),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.red,
          ),
        ),
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'แก้ไขโปรไฟล์',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Prompt',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 20),
            child: IconButton(
              icon: Icon(Icons.check, size: 30),
              onPressed: () {
                insertinformation();
              },
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 100),
            ],
          ),
        ),
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

    Map<String, dynamic> map = Map();
    map['Email'] = firebaseAuth.currentUser.email;
    map['URLpic'] = urlPic;
    map['Fname'] = fname;
    map['Lname'] = lname;
    map['Birthday'] = birthday;
    map['Sex'] = sex;
    map['Phone'] = phone;
    map['Address'] = address;

    await databaseReference
        .collection('Customer')
        .document(firebaseAuth.currentUser.uid)
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

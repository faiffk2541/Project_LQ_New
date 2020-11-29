import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newlaundry/userpage/profileuser/accountpage.dart';

class EditAccount extends StatefulWidget {
  String urlPic, fname, lname, phone, address, email;

  EditAccount({
    this.urlPic,
    this.fname,
    this.lname,
    this.phone,
    this.address,
    this.email,
  });

  @override
  EditAccountState createState() => EditAccountState();
}

class EditAccountState extends State<EditAccount> {
  String urlPic, fname, lname, phone, address, email;
  File imageFile, file;
  var imageFiles = [];

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController _fnameController;
  TextEditingController _lnameController;
  TextEditingController _phoneController;
  TextEditingController _addressController;

  Map map;
  @override
  void initState() {
    super.initState();
    _fnameController = new TextEditingController(text: widget.fname);
    _lnameController = new TextEditingController(text: widget.lname);
    _phoneController = new TextEditingController(text: widget.phone);
    _addressController = new TextEditingController(text: widget.address);
  }

  _openGallary(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
      this.imageFiles.add(picture);
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountPage()),
                );
                _editData();
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
                    TextFormField(
                      controller: _fnameController,
                      onChanged: (String string) {
                        print('insert fname done');
                        setState(() {
                          fname = string;
                        });
                      },
                      style: TextStyle(
                          fontFamily: 'Prompt',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '',
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
                    TextFormField(
                      controller: _lnameController,
                      onChanged: (String string) {
                        print('insert lname done');
                        setState(() {
                          lname = string;
                        });
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
                    TextFormField(
                      controller: _phoneController,
                      onChanged: (String string) {
                        print('insert phone done');
                        setState(() {
                          phone = string;
                        });
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
                    TextFormField(
                      controller: _addressController,
                      onChanged: (String string) {
                        print('insert address done');
                        setState(() {
                          address = string;
                        });
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

  // Future<void> _editData() async {
  //   final databaseReference = Firestore.instance;

  //   Map<String, dynamic> map = Map();
  //   map['Email'] = firebaseAuth.currentUser.email;
  //   map['URLpic'] = widget.urlPic;
  //   map['Fname'] = widget.fname;
  //   map['Lname'] = widget.lname;
  //   map['Phone'] = widget.phone;
  //   map['Address'] = widget.address;

  //   await databaseReference
  //       .collection('Customer')
  //       .document(firebaseAuth.currentUser.uid)
  //       .setData(map)
  //       .then((value) {
  //     print('update Successfully');
  //   });
  // }

  // void _editData() {
  //   Firestore.instance.runTransaction((Transaction transaction) async {
  //     DocumentSnapshot snapshot = await transaction.get();
  //     await transaction.update(snapshot.reference, {
  //       "Fname": fname,
  //       "Lname": lname,
  //       "Phone": phone,
  //       "Address": address,
  //     });
  //   });
  //   Navigator.pop(context);
  // }
  Future<void> _editData() async {
    final databaseReference = Firestore.instance;

    await databaseReference
        .collection('Customer')
        .document(firebaseAuth.currentUser.uid)
        .setData({
      "Fname": fname,
      "Lname": lname,
      "Email": firebaseAuth.currentUser.email,
      "Phone": phone,
      "Address": address,
      "URLpic": urlPic
    }).then((value) {
      print('update Successfully');
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

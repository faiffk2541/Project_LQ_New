import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newlaundry/laundrypage/datalaundry.dart';
import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class EditInformationLaundry extends StatefulWidget {
  final String urlPic, ename, ephone, eaddress, etime;

  EditInformationLaundry({
    this.urlPic,
    this.ename,
    this.ephone,
    this.eaddress,
    this.etime,
  });
  @override
  EditInformationLaundryState createState() => EditInformationLaundryState();
}

class EditInformationLaundryState extends State<EditInformationLaundry> {
  String urlPic = "";
  String name = "";
  String time = "";
  String address = "";
  String phone = "";

  File imageFile, file;
  var imageFiles = [];

  List<DocumentSnapshot> laundry = [];

  final firestore = Firestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController _nameController;
  TextEditingController _addressController;
  TextEditingController _phoneController;
  TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.ename);
    _addressController = TextEditingController(text: widget.eaddress);
    _phoneController = TextEditingController(text: widget.ephone);
    _timeController = TextEditingController(text: widget.etime);
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
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              'เพิ่มรายละเอียดร้าน',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Prompt',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30, width: 30),
          Container(
            padding: EdgeInsets.only(left: 30),
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Row(
                    children: imageFiles
                        .map(
                          (url) => new InkWell(
                            child: Image.file(url, height: 100, width: 100),
                            onTap: () {
                              var index = imageFiles.indexOf(url);
                              _settingModalBottomSheet(context, index);
                            },
                          ),
                        )
                        .toList()),
                Column(
                  children: [
                    InkWell(
                      child: Image.asset('assets/frame.png',
                          height: 90, width: 90),
                      onTap: () {
                        if (imageFiles.length > 0) {
                          print(imageFiles);
                        } else {
                          _showChoiceDialog(context);
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 30, width: 30),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
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
                TextFormField(
                  controller: _nameController,
                  onChanged: (String string) {
                    print('insert name done');
                    setState(() {
                      name = string;
                    });
                  },
                  style: TextStyle(
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ชื่อร้าน',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Prompt',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    prefixIcon: Icon(
                      Icons.shopping_basket,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30, width: 30),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
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
                TextFormField(
                  controller: _timeController,
                  onChanged: (String string) {
                    time = string.trim();
                    print('insert time done');
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'เวลา',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Prompt',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    prefixIcon: Icon(
                      Icons.access_time,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30, width: 30),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
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
                TextFormField(
                  controller: _addressController,
                  onChanged: (String string) {
                    address = string.trim();
                    print('insert address done');
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ที่อยู่ร้าน',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Prompt',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30, width: 30),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
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
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    phone = value.trim();
                    print('insert phone done');
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'เบอร์โทร',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Prompt',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
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
                    Container(
                      width: 120,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () async {
                          if (phone == null) {
                            print('insert phone done');
                            showAlert('Wrong', 'please check Phone Number');
                          } else if (phone.length < 10) {
                            print('insert phone done');
                            showAlert('Wrong', 'please check Phone Number');
                          } else if (phone.length > 10) {
                            print('insert phone done');
                            showAlert('Wrong', 'please check Phone Number');
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DataLaundry()),
                            );
                            uploadPicToStorage();
                          }
                        },
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "บันทึก",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontFamily: 'Prompt',
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context, index) {
    print(index);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.remove_circle),
                    title: new Text(
                      'ลบ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Prompt',
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      setState(() {
                        imageFiles.removeAt(index);
                        Navigator.of(context).pop();
                        deleteImage(urlPic);
                      });
                    }),
              ],
            ),
          );
        });
  }

  Future<void> deleteImage(String urlPic) async {
    var fileUrl = Uri.decodeFull(Path.basename(urlPic))
        .replaceAll(new RegExp(r'(\?alt).*'), '');

    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileUrl);
    await firebaseStorageRef.delete();
    print('Successfully deleted $urlPic from storage');
  }

  Future<void> uploadPicToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    StorageReference storageReference =
        firebaseStorage.ref().child('PicInformationelaundry/inforlaunry$i.jpg');
    StorageUploadTask storageUploadTask = storageReference.putFile(imageFile);

    urlPic = await (await storageUploadTask.onComplete).ref.getDownloadURL();
    print('urlPic is = $urlPic');
    insertinformation();
  }

  Future<void> showAlert(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Prompt',
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          );
        });
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
                      'กล้องถ่ายรูป',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Prompt',
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      _openCamera(ImageSource.camera);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  // _editData() {
  //   List<String> splitList = name.split(" ");
  //   List<String> indexList = [];
  //   for (int i = 0; i < splitList.length; i++) {
  //     for (int y = 1; y < splitList[i].length + 1; y++) {
  //       indexList.add(splitList[i].substring(0, y).toLowerCase());
  //     }
  //   }
  //   print(indexList);
  //   Firestore.instance
  //       .collection("Customer")
  //       .doc(firebaseAuth.currentUser.uid)
  //       .update({
  //     "Name": _nameController.text,
  //     "Time": _timeController.text,
  //     "Email": firebaseAuth.currentUser.email,
  //     "Phone": _phoneController.text,
  //     "Address": _addressController.text,
  //     "URLpic": urlPic
  //   });
  // }

  Future<void> insertinformation() async {
    List<String> splitList = name.split(" ");
    List<String> indexList = [];
    for (int i = 0; i < splitList.length; i++) {
      for (int y = 1; y < splitList[i].length + 1; y++) {
        indexList.add(splitList[i].substring(0, y).toLowerCase());
      }
    }

    print(indexList);
    Firestore.instance
        .collection('Laundry')
        .document(firebaseAuth.currentUser.uid)
        .setData({
      "Name": name,
      // 'Name': _nameController.text,
      'Time': _timeController.text,
      'Address': _addressController.text,
      'Phone': _phoneController.text,
      'URLpic': urlPic,
      'searchIndex': indexList
    });
    print('insert Succesfully');
  }
}

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:newlaundry/navigationbar.dart';
import 'package:newlaundry/userpage/homepage.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:newlaundry/userpage/menu/menuservice.dart';
import 'package:path/path.dart' as Path;

class MenuDetailPage extends StatefulWidget {
  @override
  MenuDetailState createState() => MenuDetailState();
}

class MenuDetailState extends State<MenuDetailPage> {
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
                  child: Container(
                    child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/flutter-firebase-ba75e.appspot.com/o/PicInformationelaundry%2Finforlaunry67424.jpg?alt=media&token=63155dd7-c33b-4a8d-bc55-96b09d5cad35'),
                  ),
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
              child: Column(
                children: [
                  shopLocation(name: "พิกัด"),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      shopName(name: "ร้านซักรีด"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      showtime(name: "time"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      shopDetail(name: "ที่อยู่ร้าน"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      telphone(name: "เบอร์โทร"),
                    ],
                  ),
                ],
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

Expanded shopName({String name}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ร้านซักผ้า',
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
  );
}

Expanded showtime({String name}) {
  return Expanded(
    child: Row(
      children: [
        Icon(Icons.access_time),
        SizedBox(height: 10, width: 10),
        Flexible(
          child: Text(
            '8:00 - 18:00 น.',
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
  );
}

Expanded shopDetail({String name}) {
  return Expanded(
    child: Row(
      children: [
        Icon(Icons.home),
        SizedBox(height: 10, width: 10),
        Flexible(
          child: Text(
            '104 ซอย ประชาอุทิศ 45 ถนนประชาอุทิศ แขวงบางมด เขตทุ่งครุ กรุงเทพมหานคร 10140',
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
  );
}

Expanded telphone({String name}) {
  return Expanded(
    child: Row(
      children: [
        Icon(Icons.phone),
        SizedBox(height: 10, width: 10),
        Flexible(
          child: Text(
            '0128924567',
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
  );
}

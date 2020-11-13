import 'package:flutter/material.dart';
import 'package:newlaundry/userpage/cart/addcart.dart';

class DetailServicePage extends StatefulWidget {
  @override
  DetailServiceState createState() => DetailServiceState();
}

class DetailServiceState extends State<DetailServicePage> {
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
            alignment: Alignment.topCenter,
            child: Text(
              'รายการ',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Prompt',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30),
          Container(
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Image.asset('assets/laundry-basket.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Column(
                        children: [
                          Text(
                            'เสื้อ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '25 บาท',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/minus.png',
                                    width: 30, height: 30),
                              ),
                              SizedBox(width: 20),
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(width: 20),
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/add.png',
                                    width: 30, height: 30),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Image.asset('assets/dress.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Column(
                        children: [
                          Text(
                            'กระโปรง',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '25 บาท',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/minus.png',
                                    width: 30, height: 30),
                              ),
                              SizedBox(width: 20),
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(width: 20),
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/add.png',
                                    width: 30, height: 30),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Image.asset('assets/pants.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Column(
                        children: [
                          Text(
                            'กางเกง (ยาว)',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '25 บาท',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/minus.png',
                                    width: 30, height: 30),
                              ),
                              SizedBox(width: 20),
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(width: 20),
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/add.png',
                                    width: 30, height: 30),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Image.asset('assets/shorts.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Column(
                        children: [
                          Text(
                            'กางเกง (สั้น)',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '25 บาท',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Prompt',
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/minus.png',
                                    width: 30, height: 30),
                              ),
                              SizedBox(width: 20),
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Prompt',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(width: 20),
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/add.png',
                                    width: 30, height: 30),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 15),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "รวมทั้งหมด",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Prompt',
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "100 บาท",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Prompt',
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  height: 50,
                  child: RaisedButton(
                    child: Text(
                      "ใส่ตระกร้า",
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontFamily: 'Prompt',
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddCartPage()),
                      );
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

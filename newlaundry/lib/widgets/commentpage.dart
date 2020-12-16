import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  final String laundryUID;

  CommentPage(this.laundryUID);

  @override
  CommentPageState createState() => CommentPageState();
}

class CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 35, left: 15),
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
                  'ความคิดเห็น',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontFamily: 'Prompt',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Laundry")
                      .doc(widget.laundryUID)
                      .collection("Review")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print('it can connect to firebase');
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          final i = index + 1;
                          DocumentSnapshot Review =
                              snapshot.data.documents[index];
                          return Container(
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 15, bottom: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'ความคิดเห็นที่  ',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontFamily: 'Prompt',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '$i',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontFamily: 'Prompt',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, bottom: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        Review.data()['Comment'],
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontFamily: 'Prompt',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

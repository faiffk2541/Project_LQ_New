import 'package:flutter/material.dart';
import 'package:newlaundry/userpage/detailservice/detailservicefold.dart';
import 'package:newlaundry/userpage/detailservice/detailserviceiron.dart';
import 'package:newlaundry/userpage/detailservice/detailservicewashing.dart';

class MenuServicePage extends StatefulWidget {
  final String laundryUID;

  MenuServicePage(this.laundryUID);

  @override
  MenuServiceState createState() => MenuServiceState();
}

class MenuServiceState extends State<MenuServicePage> {
  String washing = "ซักรีด";
  String fold = "ซักพับ";
  String iron = "รีด";

  @override
  void initState() {
    super.initState();
  }

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
              'บริการของร้าน',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Prompt',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 100),
          Container(
            child: Center(
              child: Container(
                width: 200,
                height: 50,
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    '$washing',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontFamily: 'Prompt',
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailServiceWashingPage(widget.laundryUID)),
                    );
                    // showAlert();
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            child: Center(
              child: Container(
                width: 200,
                height: 50,
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    '$fold',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontFamily: 'Prompt',
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    // showAlert();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailServiceFoldPage(widget.laundryUID)),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            child: Center(
              child: Container(
                width: 200,
                height: 50,
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    '$iron',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontFamily: 'Prompt',
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailServiceIronPage(widget.laundryUID)),
                    );
                    // showAlert();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void showAlert() {
  //   AlertDialog dialog = new AlertDialog(
  //     content: new Container(
  //       width: 250.0,
  //       height: 250.0,
  //       child: new Column(
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: <Widget>[
  //           Expanded(
  //             child: Container(
  //               padding: EdgeInsets.all(16),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   RaisedButton(
  //                     onPressed: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => DetailServicePage()),
  //                       );
  //                     },
  //                     elevation: 0,
  //                     color: Colors.red,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.all(Radius.circular(50)),
  //                     ),
  //                     child: Center(
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Text(
  //                             'รายวัน',
  //                             style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontFamily: 'Prompt',
  //                                 fontWeight: FontWeight.w400,
  //                                 fontSize: 20),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: 50),
  //                   RaisedButton(
  //                     onPressed: () {},
  //                     elevation: 0,
  //                     color: Colors.blue,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.all(Radius.circular(50)),
  //                     ),
  //                     child: Center(
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Text(
  //                             'รายเดือน',
  //                             style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontFamily: 'Prompt',
  //                                 fontWeight: FontWeight.w400,
  //                                 fontSize: 20),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );

  //   showDialog(context: context, child: dialog);
  // }
}

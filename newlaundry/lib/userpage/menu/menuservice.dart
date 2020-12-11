import 'package:flutter/material.dart';
import 'package:newlaundry/userpage/detailservice/detailservicefold.dart';
import 'package:newlaundry/userpage/detailservice/detailserviceiron.dart';
import 'package:newlaundry/userpage/detailservice/detailservicewashing.dart';

class MenuServicePage extends StatefulWidget {
  final String laundryUID;
  final String name;
  final String customerFname;

  MenuServicePage(this.laundryUID, this.name, this.customerFname);

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
                          builder: (context) => DetailServiceWashingPage(
                              widget.laundryUID,
                              widget.name,
                              widget.customerFname)),
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
                    '$fold',
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
                          builder: (context) => DetailServiceFoldPage(
                            
                              widget.laundryUID,
                              widget.name,
                              widget.customerFname)),
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
                          builder: (context) => DetailServiceIronPage(
                              widget.laundryUID,
                              widget.name,
                              widget.customerFname)),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

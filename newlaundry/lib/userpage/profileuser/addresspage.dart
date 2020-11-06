import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

class AddressPage extends StatefulWidget {
  @override
  AddressPageState createState() => AddressPageState();
}

class AddressPageState extends State<AddressPage> {
  
  // String locationMessage = "";
  //   void getCurrentLocation() async {
  //   final position = await Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   print(position);

  //   setState(() {
  //     locationMessage = "${position.latitude}, ${position.longitude}";
  //   });
  // }

  // List project = ["A", "B"];

  // List<DropdownMenuItem<String>> _dropDownMenuItems;
  // String selectedProject;

  // @override
  // void initState() {
  //   _dropDownMenuItems = buildAndGetDropDownMenuItems(project);
  //   selectedProject = _dropDownMenuItems[0].value;
  //   super.initState();
  // }

  // List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
  //   List<DropdownMenuItem<String>> items = List();
  //   for (String fruit in fruits) {
  //     items.add(DropdownMenuItem(value: fruit, child: Text(fruit)));
  //   }
  //   return items;
  // }

  // void changedDropDownItem(String selectedFruit) {
  //   setState(() {
  //     selectedProject = selectedFruit;
  //   });
  // }

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
              'ที่อยู่ของฉัน',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Prompt',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                elevation: 0,
                onPressed: () {

                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 30),
                      SizedBox(width: 10),
                      Text(
                        'เพิ่มที่อยู่',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Prompt',
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

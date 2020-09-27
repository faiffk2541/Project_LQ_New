import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:newlaundry/userpage/menu/menuservice.dart';

class MenuDetailPage extends StatefulWidget {
  @override
  MenuDetailState createState() => MenuDetailState();
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class MenuDetailState extends State<MenuDetailPage> {
  List<ListItem> _dropdownItems = [
    ListItem(1, "รายวัน"),
    ListItem(2, "รายเดือน"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Row(
            children: [
              Text(
                listItem.name,
                style: TextStyle(
                    color: Colors.blue[900],
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
            ],
          ),
          value: listItem,
        ),
      );
    }
    return items;
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
            margin: EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 25),
            child: Center(
              child: Container(
                height: 250,
                width: 350,
                //color: Colors.white,
                child: Center(
                  child: Image.asset('assets/shop1.png'),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
            //height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                shopLocation(name: "พิกัด"),
                SizedBox(height: 10),
                Row(
                  children: [
                    shopName(name: "ร้านซักรีด"),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    showtime(name: "time"),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    shopDetail(name: "ที่อยู่ร้าน"),
                  ],
                ),
                SizedBox(height: 100),
                Column(
                  children: [
                    Container(
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 50,
                          // child: RaisedButton(
                          //   elevation: 0,
                          //   color: Colors.blue,
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(50)),
                          //   child: Text(
                          //     'บริการของร้าน',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontFamily: 'Prompt',
                          //         fontWeight: FontWeight.w400,
                          //         fontSize: 20),
                          //   ),
                          //   onPressed: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => MenuServicePage()),
                          //     );
                          //   },
                          // ),
                          // child: DropdownButton<ListItem>(
                          //     value: _selectedItem,
                          //     items: _dropdownMenuItems,
                          //     onChanged: (value) {
                          //       setState(() {
                          //         _selectedItem = value;
                          //       });
                          //     }),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 15.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                  border: Border.all()),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    value: _selectedItem,
                                    items: _dropdownMenuItems,
                                    onChanged: (value) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MenuServicePage()),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
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

// class Item {
//   const Item(this.name, this.icon);
//   final String name;
//   final Icon icon;
// }

// List<Item> users = <Item>[
//   const Item(
//       'รายวัน',
//       Icon(
//         Icons.data_usage,
//         color: Colors.blue,
//       )),
//   const Item(
//       'รายเดือน',
//       Icon(
//         Icons.date_range,
//         color: Colors.blue,
//       )),
// ];

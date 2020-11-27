import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  bool searchState = false;
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
              children: [
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
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                child: ListTile(
                  leading: new Icon(Icons.search),
                  title: TextField(
                    //controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Prompt',
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                    // onChanged: onSearchTextChanged,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      // controller.clear();
                      // onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

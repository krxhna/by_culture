// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions.dart';
import 'data.dart';

class user {
  String company;
  String describ;

  user(this.company, this.describ);
}

var list = ['jk', 'olp', 'io', 'op', 'fjkdf', 'fhadhfa'];
List<String> selectedlist = <String>[];

List<user> list1 = [
  user("naver", "search"),
  user("target", "shopping"),
  user("walmart", "cheap shopping"),
  user("netflix", "tv")
];

void main() => runApp(MyApp());
var maincolor = Colors.black;
var seccondarycolor = Colors.white;

_cards(companyname, des) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
        color: seccondarycolor,
        child: Column(
          children: [
            Text(
              companyname,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              companyname,
              style: TextStyle(fontSize: 20),
            ),
          ],
        )),
  );
}

Widget _buildChip(String label, Color color) {
  return Chip(
    labelPadding: EdgeInsets.all(2.0),
    avatar: CircleAvatar(
      backgroundColor: Colors.white70,
      child: Text(label[0].toUpperCase()),
    ),
    label: Text(
      label,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey[60],
    padding: EdgeInsets.all(8.0),
  );
}

var button_text = "hello";

class MyApp extends StatelessWidget {
  bool pressGeoON = false;
  bool cmbscritta = false;
  // var maincolor = Color(0xff19CE60);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'By Culture',
      home: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 170.0),
            child: Container(
              height: 100,
              width: 100,
              child: FittedBox(child: floating()),
            ),
          ),
          backgroundColor: maincolor,
          appBar: AppBar(
            backgroundColor: maincolor,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'By Culture',
                style: TextStyle(color: seccondarycolor),
              ),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60),
                child: Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          "Find engineering teams that share your values",
                          style: TextStyle(
                              fontSize: 50,
                              color: seccondarycolor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Select your top values and find teams you'll click with.",
                          style:
                              TextStyle(fontSize: 20, color: seccondarycolor),
                        ),
                      ),
                      Container(
                        height: 500,
                        width: 1100,
                        color: seccondarycolor,
                        child: Row(
                          children: [
                            tags_builder(teamvalues),
                            tags_builder(company_properties),
                            tags_builder(strategy),
                            display()

                            // ListView.builder(
                            //   itemCount: selectedlist.length,
                            //   itemBuilder: (BuildContext context, int index) {
                            //     return Text(selectedlist[index]);
                            //   },
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 0),
                            //   child: ListView.builder(
                            //     itemCount: selectedlist.length,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       return chipwidget(
                            //         chipname: selectedlist[index],
                            //       );
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30),
                      Container(
                        height: 1000,
                        color: maincolor,
                        child: GridView.builder(
                            itemCount: list1.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                              return _cards(
                                  list1[index].company, list1[index].describ);
                            }),
                      ),
                      Container(
                        height: 1000,
                        color: maincolor,
                        child: GridView.builder(
                            itemCount: selectedlist.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                              return _cards(
                                  selectedlist[index], selectedlist[index]);
                            }),
                      ),

                      // Container(
                      //   child: GridView.builder(
                      //       itemCount: 10,
                      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //           crossAxisCount: 3),
                      //       itemBuilder: (BuildContext context, int index) {
                      //         return Container(child: Text("op"));
                      //       }),
                      // )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class chipwidget extends StatefulWidget {
  final String chipname;
  chipwidget({Key key, this.chipname}) : super(key: key);

  @override
  _chipwidgetState createState() => _chipwidgetState();
}

class _chipwidgetState extends State<chipwidget> {
  var _isselected = false;
  var textcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InputChip(
        selected: _isselected,
        backgroundColor: Colors.black,
        label: Text(
          widget.chipname,
          style: TextStyle(color: textcolor),
        ),
        onSelected: (isselcted) {
          setState(() {
            selectedlist.insert(0, widget.chipname);
            textcolor = Colors.black;
            _isselected = true;
            print(selectedlist);
            display(
              chipname: selectedlist,
            );
            floating();
          });
        },
        selectedColor: Colors.amber,
        onDeleted: () {
          setState(() {
            selectedlist.remove(widget.chipname);
            textcolor = Colors.white;
            _isselected = false;
            print(selectedlist);
            display();
            floating();
          });
        },
      ),
    );
  }
}

class display extends StatefulWidget {
  var chipname = ["op"];
  display({Key key, this.chipname}) : super(key: key);

  @override
  _displayState createState() => _displayState();
}

class _displayState extends State<display> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      color: Colors.white,
      child: ListView.builder(
        itemCount: selectedlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(selectedlist[index]);
        },
      ),
    );
  }
}

class floating extends StatefulWidget {
  floating({Key key}) : super(key: key);

  @override
  _floatingState createState() => _floatingState();
}

class _floatingState extends State<floating> {
  @override
  Widget build(BuildContext context) {
    return Text("selecttoString");
  }
}




// FilterChip(
//       selected: _isselected,
//       backgroundColor: Colors.blue,
//       label: Text(widget.chipname),
//       onSelected: (isselcted) {
//         setState(() {
//           if (_isselected = false) {
//             _isselected = true;
//           } else {
//             _isselected = true;
//           }
//         });
//       },
//       selectedColor: Colors.amber,
//     );
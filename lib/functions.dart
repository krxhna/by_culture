import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

tags_builder(list) {
  return Column(
    children: [
      Text("work"),
      Container(
        color: Colors.white,
        width: 150,
        height: 300,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return chipwidget(chipname: list[index]);
          },
        ),
      ),
    ],
  );
}

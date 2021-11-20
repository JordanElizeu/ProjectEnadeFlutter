import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget drawer() {
  return Drawer(
      child: Container(
    color: Colors.white,
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Icon(
            Icons.work_outlined,
            size: 100,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 40)),
        ListTile(
          tileColor: Colors.white,
          title: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    "Início",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              )),
        ),
      ],
    ),
  ));
}

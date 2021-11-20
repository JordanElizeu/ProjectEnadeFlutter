import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarTablet() {
  return Container(
    color: Colors.white,
    height: 80,
    child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "images/enade.jfif",
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "images/gov.png",
                  height: 100,
                ),
              ),
            ],
          ),
        ),
  );
}

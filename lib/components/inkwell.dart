import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget inkwellText({textName,Function function}){
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: InkWell(
      child: Text(textName,style: TextStyle(color: Colors.blue),),
      onTap: function,
    ),
  );
}
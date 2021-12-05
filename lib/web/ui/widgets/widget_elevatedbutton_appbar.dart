import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget elevatedButton(
    {nameButton,
      Function function,
      IconData icon,
      Color colorText,
      @required Color colorBackGroundButton,
      Color overlayColor}) {
  return FittedBox(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 125,
        height: 35,
        child: ElevatedButton(
          onPressed: function,
          child: Row(
            children: [
              Icon(icon),
              Expanded(
                child: Center(
                  child: Text(
                    nameButton,
                    style: TextStyle(
                        color: colorText == null ? Colors.white : colorText),
                  ),
                ),
              ),
            ],
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
                overlayColor == null ? Colors.white38 : overlayColor),
            backgroundColor: MaterialStateProperty.all(colorBackGroundButton),
            elevation: MaterialStateProperty.all(10),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
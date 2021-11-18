import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget appBar() {
  const _buttonLogin = "Entrar";
  return Material(
    elevation: 20,
    child: Container(
      color: Colors.white,
      width: double.infinity,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
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
              Row(
                children: [
                  inkwellText(textName: "gov.com",function: (){}),
                  inkwellText(textName: "Legislação",function: (){}),
                  inkwellText(textName: "Orgãos do Governo",function: (){}),
                  inkwellText(textName: "Acessibilidade",function: (){}),
                  inkwellText(textName: "Quiz",function: (){}),
                  elevatedButton(
                      nameButton: _buttonLogin,
                      function: () {},
                      icon: Icons.person,
                      colorText: Colors.white,
                      colorBackGroundButton: Colors.blue),
                ],
              ),
              //InkWell
            ],
          ),
        ),
      ),
    ),
  );
}

Widget inkwellText({textName,Function function}){
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: InkWell(
      child: Text(textName,style: TextStyle(color: Colors.blue),),
      onTap: function,
    ),
  );
}

Widget elevatedButton(
    {nameButton,
    Function function,
    IconData icon,
    Color colorText,
    @required Color colorBackGroundButton,
    Color overlayColor}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 35,
      width: 150,
      child: ElevatedButton(
        onPressed: function,
        child: Row(
          children: [
            Icon(icon),
            Center(
              child: Text(
                nameButton,
                style: TextStyle(
                    color: colorText == null ? Colors.white : colorText),
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
  );
}

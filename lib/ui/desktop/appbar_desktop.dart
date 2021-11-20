import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/components/inkwell.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/router/Router.dart';
import '../app_bar.dart';

Widget appBarDesktop(BuildContext context) {
  return Material(
    elevation: 20,
    child: LayoutBuilder(builder: (_,constraints){
      return Container(
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
                Container(
                  width: constraints.maxWidth*0.60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      inkwellText(textName: ViewAppBar().titleAccessibilityLink,function: (){ControllerAllMethods().openUrl(ViewAppBar().linkAccessibility);}),
                      inkwellText(textName: ViewAppBar().titleResultsLink,function: (){}),
                      inkwellText(textName: ViewAppBar().titleQuizLink,function: (){}),
                      _elevatedButton(
                          nameButton: ViewAppBar().buttonLogin,
                          function: () {ControllerAllMethods().transitionScreen(nameRoute: Routes.LOGIN, context: context);},
                          icon: Icons.person,
                          colorText: Colors.white,
                          colorBackGroundButton: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    )
  );
}

Widget _elevatedButton(
    {nameButton,
      Function function,
      IconData icon,
      Color colorText,
      @required Color colorBackGroundButton,
      Color overlayColor}) {
  return Padding(
    padding: const EdgeInsets.only(left: 40),
    child: Container(
      height: 35,
      width: 150,
      child: ElevatedButton(
        onPressed: function,
        child: Row(
          children: [
            Icon(icon),
            Center(
              child: Container(
                width: 100,
                child: Center(
                  child: Text(
                    nameButton,
                    style: TextStyle(
                        color: colorText == null ? Colors.white : colorText),
                  ),
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
  );
}
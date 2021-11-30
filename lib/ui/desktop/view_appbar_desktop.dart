import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/components/inkwell.dart';
import 'package:project_enade/controller/controller_initialpage_desktop.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/router/Router.dart';
import '../app_bar_tablet_or_desktop.dart';

Widget appBarDesktop(BuildContext context) {
  return Material(
    elevation: 20,
    child: LayoutBuilder(builder: (_,constraints){
      return Container(
        alignment: Alignment.centerLeft,
        color: Colors.white,
        width: constraints.maxWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 500,
                color: Color(0xff0e4180),
                child: FittedBox(
                  child: Image.asset(
                    "images/enade.jfif",
                    height: constraints.maxHeight,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24,right: 24),
                    child: Image.asset(
                      "images/gov.png",
                      height: constraints.maxHeight*0.60,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      inkwellText(textName: ViewAppBar().titleAccessibilityLink,function: (){ControllerAllMethods().openUrl(ViewAppBar().linkAccessibility);}),
                      inkwellText(textName: ViewAppBar().titleResultsLink,function: (){ControllerInitialPageDesktop().methodForShowResults(context);}),
                      inkwellText(textName: ViewAppBar().titleQuizLink,function: (){ControllerAllMethods().transitionScreen(nameRoute: Routes.INITIAL, context: context);}),
                      _elevatedButton(
                          nameButton: ViewAppBar().buttonLogin,
                          function: () {ControllerAllMethods().transitionScreen(nameRoute: Routes.LOGIN, context: context);},
                          icon: Icons.person,
                          colorText: Colors.white,
                          colorBackGroundButton: Colors.blue),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
  return FittedBox(
    child: Padding(
      padding: const EdgeInsets.all(32.0),
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
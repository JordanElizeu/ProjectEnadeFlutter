import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';
import 'package:project_enade/components/inkwell.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/router/Router.dart';

import '../app_bar.dart';

Widget appBarMobile(BuildContext context) {
  final List<String> listButtons = [
    'Quiz',
    'Resultados',
    'Acessar conta',
    'Acessibilidade',
  ];

  return LayoutBuilder(builder: (_, constraints) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: 80,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "images/enade.jfif",
              height: constraints.maxHeight*0.10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "images/gov.png",
                height: constraints.maxHeight*0.10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Container(
                width: constraints.maxWidth*0.25,
                height: 35,
                child: MenuButton<String>(
                  child: Icon(Icons.list),
                  items: listButtons,
                  itemBuilder: (String value) => Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
                    child: Text(value),
                  ),
                  onItemSelected: (String value) {
                    switch(value){
                      case "Quiz":
                        ControllerAllMethods().transitionScreen(nameRoute: Routes.INITIAL, context: context);
                        break;
                      case "Resultados":
                        ControllerAllMethods().transitionScreen(nameRoute: Routes.RESULTADOS, context: context);
                        break;
                      case "Acessar conta":
                        ControllerAllMethods().transitionScreen(nameRoute: Routes.LOGIN, context: context);
                        break;
                      case "Acessibilidade":
                        inkwellText(textName: ViewAppBar().titleAccessibilityLink,function: (){ControllerAllMethods().openUrl(ViewAppBar().linkAccessibility);});
                        break;
                    }
                  },
                  onMenuButtonToggle: (bool isToggle) {
                    print(isToggle);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  });
}

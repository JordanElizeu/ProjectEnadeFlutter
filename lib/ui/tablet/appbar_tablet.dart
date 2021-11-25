import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';
import 'package:project_enade/components/inkwell.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/router/Router.dart';
import 'package:project_enade/ui/app_bar.dart';

Widget appBarTablet(BuildContext context) {
  final List<String> listButtons = [
    'Quiz',
    'Resultados',
    'Acessar conta',
    'Acessibilidade',
  ];

  return Material(
    elevation: 20,
    child: LayoutBuilder(builder: (_, constraints) {
      return Container(
        color: Colors.white,
        width: constraints.maxWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "images/enade.jfif",
              height: constraints.maxHeight,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0,right: 24.0),
              child: Image.asset(
                "images/gov.png",
                height: constraints.maxHeight*0.60,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    width: 100,
                    child: MenuButton<String>(
                      child: Icon(Icons.menu,color: Colors.blue),
                      items: listButtons,
                      itemBuilder: (String value) => Container(
                        height: 40,
                        alignment: Alignment.centerLeft,
                        padding:
                            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
                        child: FittedBox(child: Text(value)),
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
                ),
              ),
            )
          ],
        ),
      );
    }),
  );
}

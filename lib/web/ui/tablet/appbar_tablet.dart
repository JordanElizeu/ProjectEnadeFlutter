import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';
import 'package:project_enade/web/ui/widgets/inkwell.dart';
import 'package:project_enade/web/controller/controller_methods.dart';
import 'package:project_enade/web/router/app_routes.dart';
import 'package:project_enade/web/ui/widgets/app_bar_tablet_or_desktop.dart';

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
        alignment: Alignment.centerLeft,
        width: constraints.maxWidth,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 500,
                color: Color(0xff0e4180),
                child: FittedBox(
                  child: Image.asset(
                    "assets/images/enade.jfif",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0,right: 24.0),
                        child: Image.asset(
                          "assets/images/gov.png",
                          height: constraints.maxHeight*0.60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    width: 120,
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
                            ControllerAllMethods().transitionScreen(nameRoute: Routes.RESULTS, context: context);
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

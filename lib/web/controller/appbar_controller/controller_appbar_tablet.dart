import 'package:flutter/cupertino.dart';
import 'package:project_enade/web/controller/generic_controller/controller_firebase.dart';
import 'package:project_enade/web/controller/generic_controller/controller_methods.dart';
import 'package:project_enade/web/controller/initialpage_controller/controller_initialpage_desktop.dart';
import 'package:project_enade/web/router/app_routes.dart';
import 'package:project_enade/web/ui/app_bar_tablet_or_desktop.dart';
import 'package:project_enade/web/ui/widgets/inkwell.dart';

class ControllerAppBarTablet{

  void selectionMenuActionBar({@required String value, @required BuildContext context}){
    switch (value.toString()) {
      case "Quiz":
        ControllerAllMethods().pageTransition(
            nameRoute: Routes.INITIAL, context: context);
        break;
      case "Resultados":
        if(ControllerFirebase().userIsOn()){
          ControllerAllMethods().pageTransition(
              nameRoute: Routes.RESULTS, context: context);
        }else{
          ControllerInitialPageDesktop().methodForShowResults(context);
        }
        break;
      case "Acessar conta":
        ControllerAllMethods().pageTransition(
            nameRoute: Routes.LOGIN, context: context);
        break;
      case "Acessibilidade":
        inkwellText(
            textName: ViewAppBar().titleAccessibilityLink,
            function: () {
              ControllerAllMethods().openExternalUrl(
                  url: ViewAppBar().linkAccessibility,
                  context: context);
            });
        break;
    }
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:project_enade/screen/responsive.dart';
import 'package:project_enade/ui/tablet/body_initialpage_tablet.dart';
import 'desktop/body_initialpage_desktop.dart';

class ViewBodyInitialPage extends StatelessWidget {
  //Strings
  final buttonLogin = "Entrar";
  final linkAccessibility = "https://www.gov.br/governodigital/pt-br/acessibilidade-digital";
  final titleAccessibilityLink = "Acessibilidade";
  final titleResultsLink = "Resultados";
  final titleQuizLink = "Quiz";

  @override
  Widget build(BuildContext context) {
    final screen = getFormFactor(context).toString();
    if (screen == "ScreenType.Tablet"){
      return bodyInitialPageDesktop(context);
    }else{
      return bodyInitialPageTablet(context);
    }
  }

  IconTitleCardItem iconTitleCardItem({title,IconData icon}) {
    return IconTitleCardItem(
      text: title,
      iconData: icon,
    );
  }
}
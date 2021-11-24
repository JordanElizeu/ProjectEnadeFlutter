import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/ui/tablet/appbar_tablet.dart';
import 'desktop/appbar_desktop.dart';

class ViewAppBar extends StatelessWidget {
  //Strings
  final buttonLogin = "Entrar";
  final linkAccessibility = "https://www.gov.br/governodigital/pt-br/acessibilidade-digital";
  final titleAccessibilityLink = "Acessibilidade";
  final titleResultsLink = "Resultados";
  final titleQuizLink = "Quiz";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width * 0.40 < 270){
      return appBarTablet(context);
    }else{
      return appBarDesktop(context);
    }
  }
}

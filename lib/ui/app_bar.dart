import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_enade/controller/controller.dart';
import 'package:project_enade/router/Router.dart';

class ViewAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return appBar(context);
  }
}

Widget appBar(BuildContext context) {
  const _buttonLogin = "Entrar";
  const _linkOrgansOfGovern = "https://www.gov.br/pt-br/orgaos-do-governo";
  const _linkLegislation = "http://www4.planalto.gov.br/legislacao/";
  const _linkAccessibility = "https://www.gov.br/governodigital/pt-br/acessibilidade-digital";
  const _linkGov = "https://www.gov.br/inep/pt-br/areas-de-atuacao/avaliacao-e-exames-educacionais/enade";
  const _titleLegislationLink = "Legislação";
  const _titleOrgansOfGovernLink = "Orgãos do Governo";
  const _titleAccessibilityLink = "Acessibilidade";
  const _titleResultsLink = "Resultados";
  const _titleQuizLink = "Quiz";
  const _titleGovLink = "gov.com";
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: inkwellText(textName: _titleGovLink,function: (){Controller().openUrl(_linkGov);}),
                  ),
                  inkwellText(textName: _titleLegislationLink,function: (){Controller().openUrl(_linkLegislation);}),
                  inkwellText(textName: _titleOrgansOfGovernLink,function: (){Controller().openUrl(_linkOrgansOfGovern);}),
                  inkwellText(textName: _titleAccessibilityLink,function: (){Controller().openUrl(_linkAccessibility);}),
                  inkwellText(textName: _titleResultsLink,function: (){}),
                  inkwellText(textName: _titleQuizLink,function: (){}),
                  _elevatedButton(
                      nameButton: _buttonLogin,
                      function: () {Controller().transitionScreen(nameRoute: Routes.LOGIN, context: context);},
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

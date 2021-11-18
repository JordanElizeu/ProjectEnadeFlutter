import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

Widget appBar() {
  const _buttonLogin = "Entrar";
  const _linkOrgaosDeGoverno = "https://www.gov.br/pt-br/orgaos-do-governo";
  const _linkLegislacao = "http://www4.planalto.gov.br/legislacao/";
  const _linkAcessibilidade = "https://www.gov.br/governodigital/pt-br/acessibilidade-digital";
  const _linkGov = "https://www.gov.br/inep/pt-br/areas-de-atuacao/avaliacao-e-exames-educacionais/enade";
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
                    child: inkwellText(textName: "gov.com",function: (){openUrl(_linkGov);}),
                  ),
                  inkwellText(textName: "Legislação",function: (){openUrl(_linkLegislacao);}),
                  inkwellText(textName: "Orgãos do Governo",function: (){openUrl(_linkOrgaosDeGoverno);}),
                  inkwellText(textName: "Acessibilidade",function: (){openUrl(_linkAcessibilidade);}),
                  inkwellText(textName: "Resultados",function: (){}),
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

openUrl(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    //
  }
}

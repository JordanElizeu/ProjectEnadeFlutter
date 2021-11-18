import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/controller/controller.dart';
import 'app_bar.dart';

class ViewFooter extends StatelessWidget {
  final _pathImageGitHub = "assets/images/github.png";
  final _pathImageLinkedin = "assets/images/linkedin.png";
  final _pathImageInstagram = "assets/images/instagram.png";
  final _linkInstagram = "https://www.instagram.com/jordan.lr7";
  final _linkLinkedin = "https://www.linkedin.com/in/jordanelizeu/";
  final _linkGitHub = "https://github.com/JordanElizeu";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: 300,
            color: Color(0xFF04132a),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _formatText("gov.com"),
                ),
                _formatText(
                    "Esse site não possui nenhum tipo de convênio com o Instituto Exame Nacional de Desempenho de Estudantes - ENADE. Esse projeto foi desenvolvido"
                    " apenas com o intuito de desenvolvimento acadêmico."),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Column(
                    children: [
                      _linkText(
                          image: _pathImageGitHub,
                          link: "Github",
                          function: () {
                            Controller().openUrl(_linkGitHub);
                          },
                          context: context),
                      _linkText(
                          image: _pathImageLinkedin,
                          link: "Linkedin",
                          function: () {
                            Controller().openUrl(_linkLinkedin);
                          },
                          context: context),
                      _linkText(
                          image: _pathImageInstagram,
                          link: "Instagram",
                          function: () {
                            Controller().openUrl(_linkInstagram);
                          },
                          context: context)
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}

Widget _linkText(
    {@required image,
    @required Function function,
    @required link,
    @required BuildContext context}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.70,
    child: Row(
      children: [
        Image.asset(
          image,
          width: 30,
          height: 30,
        ),
        inkwellText(textName: link, function: function),
      ],
    ),
  );
}

Widget _formatText(text) {
  return LayoutBuilder(builder: (_, constraints) {
    return Container(
      width: constraints.maxWidth * 0.7,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  });
}

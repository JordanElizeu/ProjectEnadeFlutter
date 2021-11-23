import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/components/inkwell.dart';
import 'package:project_enade/controller/controller_methods.dart';

class ViewFooter extends StatelessWidget {
  final _pathImageGitHub = "assets/images/github.png";
  final _pathImageLinkedin = "assets/images/linkedin.png";
  final _pathImageInstagram = "assets/images/instagram.png";
  final _linkInstagram = "https://www.instagram.com/jordan.lr7";
  final _linkLinkedin = "https://www.linkedin.com/in/jordanelizeu/";
  final _linkGitHub = "https://github.com/JordanElizeu";
  final _linkGitHubName = "Github";
  final _linkLinkedinName = "Linkedin";
  final _linkInstagramName = "Instagram";
  final _linkGovName = "gov.com";
  final _textFootInformation =
      "Esse site não possui nenhum tipo de convênio com o Instituto "
      "Exame Nacional de Desempenho - ENADE. Esse projeto foi desenvolvido apenas com o intuito acadêmico.";
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Center(
          child: Container(
              width: constraints.maxWidth*70,
              height: 200,
              color: Color(0xFF04132a),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: _formatText(_linkGovName,constraints),
                  ),
                  _formatText(_textFootInformation,constraints),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Container(
                      width: constraints.maxWidth*0.70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _linkText(
                              image: _pathImageGitHub,
                              link: _linkGitHubName,
                              function: () {
                                ControllerAllMethods().openUrl(_linkGitHub);
                              },
                              context: context),
                          _linkText(
                              image: _pathImageLinkedin,
                              link: _linkLinkedinName,
                              function: () {
                                ControllerAllMethods().openUrl(_linkLinkedin);
                              },
                              context: context),
                          _linkText(
                              image: _pathImageInstagram,
                              link: _linkInstagramName,
                              function: () {
                                ControllerAllMethods().openUrl(_linkInstagram);
                              },
                              context: context)
                        ],
                      ),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}

Widget _linkText(
    {@required image,
    @required Function function,
    @required link,
    @required BuildContext context}) {
  return Container(
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

Widget _formatText(text,constraints) {
  return Container(
    width: constraints.maxWidth*0.70,
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/components/inkwell.dart';
import 'package:project_enade/controller/controller_methods.dart';

class ViewFooter extends StatelessWidget {
  final pathImageGitHub = "assets/images/github.png";
  final pathImageLinkedin = "assets/images/linkedin.png";
  final pathImageInstagram = "assets/images/instagram.png";
  final linkInstagram = "https://www.instagram.com/jordan.lr7";
  final linkLinkedin = "https://www.linkedin.com/in/jordanelizeu/";
  final linkGitHub = "https://github.com/JordanElizeu";
  final linkGitHubName = "Github";
  final linkLinkedinName = "Linkedin";
  final linkInstagramName = "Instagram";
  final textFootInformation =
      "Esse site não possui nenhum tipo de convênio com o Instituto "
      "Exame Nacional de Desempenho - ENADE. Esse projeto foi desenvolvido apenas com o intuito acadêmico.";
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Center(
          child: Container(
              alignment: Alignment.bottomCenter,
              width: constraints.maxWidth * 70,
              color: Color(0xFF04132a),
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0,bottom: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: constraints.maxWidth*0.70,
                      child: Text(textFootInformation,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Container(
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              linkText(
                                  image: pathImageGitHub,
                                  constraints: constraints,
                                  link: linkGitHubName,
                                  function: () {
                                    ControllerAllMethods().openUrl(linkGitHub);
                                  },
                                  context: context),
                              linkText(
                                  image: pathImageLinkedin,
                                  constraints: constraints,
                                  link: linkLinkedinName,
                                  function: () {
                                    ControllerAllMethods().openUrl(linkLinkedin);
                                  },
                                  context: context),
                              linkText(
                                  image: pathImageInstagram,
                                  link: linkInstagramName,
                                  constraints: constraints,
                                  function: () {
                                    ControllerAllMethods().openUrl(linkInstagram);
                                  },
                                  context: context)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }

  Widget linkText(
      {@required image,
      @required Function function,
      @required link,
      @required BuildContext context,
      constraints}) {
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

  Widget formatText(text, constraints) {
    return Container(
      width: constraints.maxWidth * 0.70,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/components/inkwell.dart';
import 'package:project_enade/screen/responsive.dart';
import 'package:project_enade/ui/mobile/view_footer_mobile.dart';

import 'desktop/footer_desktop.dart';

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
  final linkGovName = "gov.com";
  final textFootInformation =
      "Esse site não possui nenhum tipo de convênio com o Instituto "
      "Exame Nacional de Desempenho - ENADE. Esse projeto foi desenvolvido apenas com o intuito acadêmico.";
  @override
  Widget build(BuildContext context) {
    final screen = getFormFactor(context).toString();
    if(screen == "ScreenType.Phone"){
      return viewFooterMobile(context);
    }else{
      return viewFooterDesktop(context);
    }
  }

  Widget linkText(
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

  Widget formatText(text,constraints) {
    return Container(
      width: constraints.maxWidth*0.70,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

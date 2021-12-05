import 'package:flutter/cupertino.dart';
import 'package:project_enade/web/controller/generic_controller/controller_methods.dart';
import 'package:project_enade/web/ui/widgets/widget_linktext.dart';

class WidgetLinksFooter {
  final textFootInformation =
      "Esse site não possui nenhum tipo de convênio com o Instituto "
      "Exame Nacional de Desempenho - ENADE. Esse projeto foi desenvolvido apenas com o intuito acadêmico.";
  Widget widgetLinksFooter({BuildContext context}) {
    final _pathImageGitHub = "assets/images/github.png";
    final _pathImageLinkedin = "assets/images/linkedin.png";
    final _pathImageInstagram = "assets/images/instagram.png";
    final _linkInstagram = "https://www.instagram.com/jordan.lr7";
    final _linkLinkedin = "https://www.linkedin.com/in/jordanelizeu/";
    final _linkGitHub = "https://github.com/JordanElizeu";
    final _linkGitHubName = "Github";
    final _linkLinkedinName = "Linkedin";
    final _linkInstagramName = "Instagram";
    return Column(
      children: [
        linkText(
            image: _pathImageGitHub,
            link: _linkGitHubName,
            function: () {
              ControllerAllMethods()
                  .openExternalUrl(context: context, url: _linkGitHub);
            },
            context: context),
        linkText(
            image: _pathImageLinkedin,
            link: _linkLinkedinName,
            function: () {
              ControllerAllMethods()
                  .openExternalUrl(url: _linkLinkedin, context: context);
            },
            context: context),
        linkText(
            image: _pathImageInstagram,
            link: _linkInstagramName,
            function: () {
              ControllerAllMethods()
                  .openExternalUrl(url: _linkInstagram, context: context);
            },
            context: context)
      ],
    );
  }
}

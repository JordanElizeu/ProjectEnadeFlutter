import 'package:flutter/cupertino.dart';
import 'package:project_enade/controller/controller_methods.dart';
import '../view_footer.dart';

Widget viewFooterDesktop(BuildContext context){
  final ViewFooter viewFooter = ViewFooter();
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
                  child: viewFooter.formatText(viewFooter.linkGovName,constraints),
                ),
                viewFooter.formatText(viewFooter.textFootInformation,constraints),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Container(
                    width: constraints.maxWidth*0.70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        viewFooter.linkText(
                            image: viewFooter.pathImageGitHub,
                            link: viewFooter.linkGitHubName,
                            function: () {
                              ControllerAllMethods().openUrl(viewFooter.linkGitHub);
                            },
                            context: context),
                        viewFooter.linkText(
                            image: viewFooter.pathImageLinkedin,
                            link: viewFooter.linkLinkedinName,
                            function: () {
                              ControllerAllMethods().openUrl(viewFooter.linkLinkedin);
                            },
                            context: context),
                        viewFooter.linkText(
                            image: viewFooter.pathImageInstagram,
                            link: viewFooter.linkInstagramName,
                            function: () {
                              ControllerAllMethods().openUrl(viewFooter.linkInstagram);
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
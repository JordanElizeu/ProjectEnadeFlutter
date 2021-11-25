import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/ui/desktop/view_footer_desktop.dart';

Widget viewFooterMobile(BuildContext context){
  final ViewFooterDesktop viewFooter = ViewFooterDesktop();
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
                    child: Text(viewFooter.textFootInformation,
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
                            viewFooter.linkText(
                                image: viewFooter.pathImageGitHub,
                                constraints: constraints,
                                link: viewFooter.linkGitHubName,
                                function: () {
                                  ControllerAllMethods().openUrl(viewFooter.linkGitHub);
                                },
                                context: context),
                            viewFooter.linkText(
                                image: viewFooter.pathImageLinkedin,
                                constraints: constraints,
                                link: viewFooter.linkLinkedinName,
                                function: () {
                                  ControllerAllMethods().openUrl(viewFooter.linkLinkedin);
                                },
                                context: context),
                            viewFooter.linkText(
                                image: viewFooter.pathImageInstagram,
                                link: viewFooter.linkInstagramName,
                                constraints: constraints,
                                function: () {
                                  ControllerAllMethods().openUrl(viewFooter.linkInstagram);
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

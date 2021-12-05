import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/controller/controller_methods.dart';
import 'package:project_enade/web/ui/widgets/strings_footer.dart';
import 'package:project_enade/web/ui/widgets/widget_linktext.dart';

class ViewFooterDesktop extends StatelessWidget {
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
                      child: SelectableText(StringsFooter.textFootInformation,
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
                                  image: StringsFooter.pathImageGitHub,
                                  constraints: constraints,
                                  link: StringsFooter.linkGitHubName,
                                  function: () {
                                    ControllerAllMethods().openUrl(StringsFooter.linkGitHub);
                                  },
                                  context: context),
                              linkText(
                                  image: StringsFooter.pathImageLinkedin,
                                  constraints: constraints,
                                  link: StringsFooter.linkLinkedinName,
                                  function: () {
                                    ControllerAllMethods().openUrl(StringsFooter.linkLinkedin);
                                  },
                                  context: context),
                              linkText(
                                  image: StringsFooter.pathImageInstagram,
                                  link: StringsFooter.linkInstagramName,
                                  constraints: constraints,
                                  function: () {
                                    ControllerAllMethods().openUrl(StringsFooter.linkInstagram);
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



  Widget formatText(text, constraints) {
    return Container(
      width: constraints.maxWidth * 0.70,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: SelectableText(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

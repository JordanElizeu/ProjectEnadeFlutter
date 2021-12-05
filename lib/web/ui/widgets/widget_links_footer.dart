import 'package:flutter/cupertino.dart';
import 'package:project_enade/web/controller/generic_controller/controller_methods.dart';
import 'package:project_enade/web/ui/widgets/strings_footer.dart';
import 'package:project_enade/web/ui/widgets/widget_linktext.dart';

Widget widgetLinksFooter({@required BuildContext context}) {
  return Column(
    children: [
      linkText(
          image: StringsFooter.pathImageGitHub,
          link: StringsFooter.linkGitHubName,
          function: () {
            ControllerAllMethods().openExternalUrl(
                context: context, url: StringsFooter.linkGitHub);
          },
          context: context),
      linkText(
          image: StringsFooter.pathImageLinkedin,
          link: StringsFooter.linkLinkedinName,
          function: () {
            ControllerAllMethods().openExternalUrl(
                url: StringsFooter.linkLinkedin, context: context);
          },
          context: context),
      linkText(
          image: StringsFooter.pathImageInstagram,
          link: StringsFooter.linkInstagramName,
          function: () {
            ControllerAllMethods().openExternalUrl(
                url: StringsFooter.linkInstagram, context: context);
          },
          context: context)
    ],
  );
}

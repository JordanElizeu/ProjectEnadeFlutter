import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/ui/widgets/inkwell.dart';
import 'package:project_enade/web/controller/initialpage_controller/controller_initialpage_desktop.dart';
import 'package:project_enade/web/controller/generic_controller/controller_methods.dart';
import 'package:project_enade/web/router/app_routes.dart';
import 'package:project_enade/web/ui/widgets/widget_elevatedbutton_appbar.dart';

import '../../app_bar_tablet_or_desktop.dart';

Widget appBarDesktop(BuildContext context) {
  return Material(
      elevation: 20,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Container(
            alignment: Alignment.centerLeft,
            color: Colors.white,
            width: constraints.maxWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 500,
                    color: Color(0xff0e4180),
                    child: FittedBox(
                      child: Image.asset(
                        "assets/images/enade.jfif",
                        height: constraints.maxHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Image.asset(
                          "assets/images/gov.png",
                          height: constraints.maxHeight * 0.60,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          inkwellText(
                              textName: ViewAppBar().titleAccessibilityLink,
                              function: () {
                                ControllerAllMethods().openExternalUrl(
                                    url: ViewAppBar().linkAccessibility,
                                    context: context);
                              }),
                          inkwellText(
                              textName: ViewAppBar().titleResultsLink,
                              function: () {
                                ControllerInitialPageDesktop()
                                    .methodForShowResults(context);
                              }),
                          inkwellText(
                              textName: ViewAppBar().titleQuizLink,
                              function: () {
                                ControllerAllMethods().pageTransition(
                                    nameRoute: Routes.INITIAL,
                                    context: context);
                              }),
                          elevatedButton(
                              nameButton: ViewAppBar().buttonLogin,
                              function: () {
                                ControllerAllMethods().pageTransition(
                                    nameRoute: Routes.LOGIN, context: context);
                              },
                              icon: Icons.person,
                              colorText: Colors.white,
                              colorBackGroundButton: Colors.blue),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ));
}



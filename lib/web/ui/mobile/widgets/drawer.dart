import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/controller/generic_controller/controller_methods.dart';
import 'package:project_enade/web/controller/initialpage_controller/controller_initialpage_mobile.dart';
import 'package:project_enade/web/router/app_routes.dart';
import '../../app_bar_tablet_or_desktop.dart';
import '../../widgets/inkwell.dart';

Widget drawer(BuildContext context) {
  final String _titleResults = "Resultados";
  final String _titleHome = "Home";
  final String _titleAds = "Quiz ADS";
  final String _titleNetwork = "Quiz REDES";

  return Drawer(child: LayoutBuilder(
    builder: (_, constraints) {
      return Container(
        height: constraints.maxHeight,
        color: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                "assets/images/title_enade.png",
                width: constraints.maxWidth * 0.70,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            _listTile(
              title: _titleHome,
              function: () {
                ControllerAllMethods().pageTransition(
                    nameRoute: Routes.INITIAL, context: context);
              },
              iconData: Icons.home,
            ),
            _listTile(
              title: _titleResults,
              function: () {
                ControllerInitialPageMobile().showResults(context);
              },
              iconData: Icons.reorder_sharp,
            ),
            _listTile(
              title: _titleAds,
              function: () {
                ControllerInitialPageMobile().initializeQuiz(context);
              },
              iconData: Icons.computer,
            ),
            _listTile(
              title: _titleNetwork,
              function: () {
                ControllerInitialPageMobile().initializeQuiz(context);
              },
              iconData: Icons.connect_without_contact,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/images/gov.png",
                      width: constraints.maxWidth * 0.3,
                    ),
                    inkwellText(
                        function: () {
                          ControllerAllMethods().openExternalUrl(
                              url: ViewAppBar().linkAccessibility,
                              context: context);
                        },
                        textName: "Acessibilidades"),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  ));
}

Widget _listTile(
    {@required IconData iconData,
    @required Function function,
    @required title}) {
  return ListTile(
    tileColor: Colors.white,
    title: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
        onPressed: function,
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.blue,
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text(
              title,
              style: TextStyle(color: Colors.black),
            )
          ],
        )),
  );
}

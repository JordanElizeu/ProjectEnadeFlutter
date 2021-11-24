import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/router/Router.dart';
import 'package:project_enade/ui/app_bar.dart';

import 'inkwell.dart';

Widget drawer(BuildContext context) {
  final String _titleResults = "Resultados";
  final String _titleHome = "Home";

  return Drawer(child: LayoutBuilder(
    builder: (_, constraints) {
      return Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("assets/images/logo_enade.png"),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            _listTile(
              title: _titleHome,
              function: () {ControllerAllMethods().transitionScreen(nameRoute: Routes.RESULTADOS, context: context);},
              iconData: Icons.home,
            ),
            _listTile(
              title: _titleResults,
              function: () {ControllerAllMethods().transitionScreen(nameRoute: Routes.INITIAL, context: context);},
              iconData: Icons.reorder_sharp,
            ),
            Container(
              height: constraints.maxHeight * 0.8,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/gov.png",
                    width: constraints.maxWidth * 0.3,
                  ),
                  inkwellText(
                      function: () {
                        ControllerAllMethods()
                            .openUrl(ViewAppBar().linkAccessibility);
                      },
                      textName: "Acessibilidades"),
                ],
              )),
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

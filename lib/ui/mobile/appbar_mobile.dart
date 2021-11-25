import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/components/drawer.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/router/Router.dart';
import 'package:project_enade/ui/mobile/view_body_mobile.dart';
import 'package:project_enade/ui/mobile/view_footer_mobile.dart';

class ViewPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return appBarMobile(context);
  }
}

Widget appBarMobile(BuildContext context) {
  final String _title = "Enade 2021";

  return LayoutBuilder(
    builder: (_, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          centerTitle: true,
          actions: [
            Container(
              width: 120,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                    onPressed: () {ControllerAllMethods().transitionScreen(context: context, nameRoute: Routes.LOGIN);},
                    child: Text("Entrar")),
              ),
            )
          ],
        ),
        drawer: Container(height: constraints.maxHeight,child: drawer(context)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/logo_enade.png"),
              ViewBodyMobile(),
              viewFooterMobile(context)
            ],
          ),
        ),
      );
    },
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/ui/mobile/widgets/drawer.dart';
import 'package:project_enade/web/controller/generic_controller/controller_methods.dart';
import 'package:project_enade/web/router/app_routes.dart';
import 'package:project_enade/web/ui/mobile/body_mobile/view_body_mobile.dart';
import 'package:project_enade/web/ui/mobile/footer_mobile/view_footer_mobile.dart';

class ViewPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return appBarMobile(context);
  }
}
//Text(_title,style: TextStyle(fontStyle: FontStyle.italic,),),
Widget appBarMobile(BuildContext context) {
  return LayoutBuilder(
    builder: (_, constraints) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Image.asset("assets/images/title_enade.png"),
          centerTitle: true,
          actions: [
            _appBarMobile(context)
          ],
        ),
        drawer:
            Container(height: constraints.maxHeight, child: drawer(context)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/banner_enade.png"),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ViewBodyMobile(),
              ),
              viewFooterMobile(context)
            ],
          ),
        ),
      );
    },
  );
}

Widget _appBarMobile(BuildContext context){
  final String _textButtonLogin = "Entrar";
  return Container(
    width: 120,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
          onPressed: () {
            ControllerAllMethods().pageTransition(
                context: context, nameRoute: Routes.LOGIN);
          },
          child: Row(
            children: [
              Icon(Icons.person,color: Colors.white,),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    _textButtonLogin,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
      ),
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher.dart';

class Controller extends GetxController{

  static PageController pageViewController = PageController();
  TextEditingController controllerSearch = TextEditingController();

  @override
  void dispose(){
    pageViewController.dispose();
  }

  void openUrl(url) async {
    try{
      await launch(url);
    }catch(e){
    }
  }

  transitionScreen({@required nameRoute, @required BuildContext context}) async{
    try{
      await Navigator.of(context).pushNamed(nameRoute);
    }catch(e){
      print(e);
    }
  }

  Future<bool> onBackPressed({@required BuildContext context,@required nameRouter }) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Você tem certeza?'),
        content: new Text('Você irá voltar para a tela anterior'),
        actions: <Widget>[
          new ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('Não'),
          ),
          new ElevatedButton(
            onPressed: () {
              Controller().transitionScreen(context: context, nameRoute: nameRouter);
            },
            child: new Text('Sim'),
          ),
        ],
      ),
    ) ?? false;
  }
}

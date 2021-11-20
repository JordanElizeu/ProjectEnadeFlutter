import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher.dart';

class ControllerAllMethods extends GetxController{

  void openUrl(url) async {
    try{
      await launch(url);
    }catch(e){
    }
  }

  transitionScreen({@required nameRoute, @required BuildContext context}) async{
    try{
      await Navigator.of(context).popAndPushNamed(nameRoute);
    }catch(e){
      print(e);
    }
  }
}

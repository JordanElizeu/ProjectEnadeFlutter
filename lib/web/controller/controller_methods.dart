import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/web/ui/widgets/dialog_exceptions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller_login.dart';

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
  transitionScreenCancelQuiz({@required nameRoute, @required BuildContext context}) async{
    final String title = "Cancelar questionário";
    final String information = "Voce está prestes a cancelar o questionário, tem certeza?";
    final String nameButton = "Cancelar Questionário";
    try{
      alertDialogFailure(
          context: context,
          title: title,
          icon: Icons.warning_amber_rounded,
          information: information,
          nameButton: nameButton,
          function: () async {
            Navigator.pop(ControllerLogin.contextControllerLogin);
            await Navigator.of(context).popAndPushNamed(nameRoute);
      });
    }catch(e){
      print(e);
    }
  }

  validatorEmail(String email) {
    return EmailValidator.validate(email);
  }
}

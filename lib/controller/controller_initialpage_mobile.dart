import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/components/dialog_exceptions.dart';
import 'package:project_enade/router/Router.dart';
import 'controller_firebase.dart';
import 'controller_methods.dart';

class ControllerInitialPageMobile extends GetxController{
  final titleErrorUserIsNotOn = "Você não está conectado";
  final informationErrorUserIsNotOn = "Entre na sua conta ou cadastre-se";

  void initializeQuiz(BuildContext context){
    if(!ControllerFirebase().userIsOn()){
      alertDialogFailure(context: context, title: titleErrorUserIsNotOn, information: informationErrorUserIsNotOn);
    }else{
      ControllerAllMethods().transitionScreen(nameRoute: Routes.FAZERQUIZ, context: context);
    }
  }
  void showResults(BuildContext context){
    if(!ControllerFirebase().userIsOn()){
      alertDialogFailure(context: context, title: titleErrorUserIsNotOn, information: informationErrorUserIsNotOn);
    }else{
      ControllerAllMethods().transitionScreen(nameRoute: Routes.RESULTADOS, context: context);
    }
  }
}
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/components/dialog_exceptions.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/router/Router.dart';
import 'controller_firebase.dart';

class ControllerInitialPageDesktop extends GetxController{
  final titleErrorUserIsNotOn = "Você não está conectado";
  final informationErrorUserIsNotOn = "Entre na sua conta ou cadastre-se";
  static PageController pageViewController = PageController();//mobile

  selectedQuizOrResults(value,BuildContext context){
    switch(value){
      case 0:
        //ADS
        if(!ControllerFirebase().userIsOn()){
          alertDialogFailure(context: context, title: titleErrorUserIsNotOn, information: informationErrorUserIsNotOn);
        }else{
          ControllerAllMethods().transitionScreen(nameRoute: Routes.QUIZ_ADS, context: context);
        }
        break;
      case 1:
        //RESULTS
        if(!ControllerFirebase().userIsOn()){
          alertDialogFailure(context: context, title: titleErrorUserIsNotOn, information: informationErrorUserIsNotOn);
        }else{
          ControllerAllMethods().transitionScreen(nameRoute: Routes.RESULTADOS, context: context);
        }
        break;
      case 2:
        //NETWORK
        if(!ControllerFirebase().userIsOn()){
          alertDialogFailure(context: context, title: titleErrorUserIsNotOn, information: informationErrorUserIsNotOn);
        }else{
          ControllerAllMethods().transitionScreen(nameRoute: Routes.QUIZ_NETWORK, context: context);
        }
        break;
    }
  }
}
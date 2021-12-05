import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/web/controller/generic_controller/controller_methods.dart';
import 'package:project_enade/web/ui/widgets/dialog_exceptions.dart';
import 'package:project_enade/web//router/app_routes.dart';
import '../generic_controller/controller_firebase.dart';

class ControllerInitialPageDesktop extends GetxController{
  final titleErrorUserIsNotOn = "Você não está conectado";
  final informationErrorUserIsNotOn = "Entre na sua conta ou cadastre-se";
  static PageController pageViewController = PageController();//mobile

  methodForShowResults(BuildContext context){
    if(!ControllerFirebase().userIsOn()){
      alertDialogFailure(context: context, title: titleErrorUserIsNotOn, information: informationErrorUserIsNotOn);
    }else{
      ControllerAllMethods().pageTransition(nameRoute: Routes.RESULTS, context: context);
    }
  }

  selectedQuizOrResults(value,BuildContext context){
    switch(value){
      case 0:
        //ADS
        if(!ControllerFirebase().userIsOn()){
          alertDialogFailure(context: context, title: titleErrorUserIsNotOn, information: informationErrorUserIsNotOn);
        }else{
          ControllerAllMethods().pageTransition(nameRoute: Routes.QUIZ_ADS, context: context);
        }
        break;
      case 1:
        //RESULTS
        if(!ControllerFirebase().userIsOn()){
          alertDialogFailure(context: context, title: titleErrorUserIsNotOn, information: informationErrorUserIsNotOn);
        }else{
          ControllerAllMethods().pageTransition(nameRoute: Routes.RESULTS, context: context);
        }
        break;
      case 2:
        //NETWORK
        if(!ControllerFirebase().userIsOn()){
          alertDialogFailure(context: context, title: titleErrorUserIsNotOn, information: informationErrorUserIsNotOn);
        }else{
          ControllerAllMethods().pageTransition(nameRoute: Routes.QUIZ_NETWORK, context: context);
        }
        break;
    }
  }
}
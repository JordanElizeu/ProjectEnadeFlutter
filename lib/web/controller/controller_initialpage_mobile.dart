import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/web/ui/widgets/dialog_exceptions.dart';
import 'package:project_enade/web/router/app_routes.dart';
import 'controller_firebase.dart';
import 'controller_methods.dart';

class ControllerInitialPageMobile extends GetxController{
  final titleErrorUserIsNotOn = "Você não está conectado";
  final informationErrorUserIsNotOn = "Entre na sua conta ou cadastre-se";

  void initializeQuiz(BuildContext context){
    if(!ControllerFirebase().userIsOn()){
      alertDialogFailure(context: context, title: titleErrorUserIsNotOn, information: informationErrorUserIsNotOn);
    }else{
      ControllerAllMethods().transitionScreen(nameRoute: Routes.INITIATE_QUIZ, context: context);
    }
  }
  void showResults(BuildContext context){
    if(!ControllerFirebase().userIsOn()){
      alertDialogFailure(context: context, title: titleErrorUserIsNotOn, information: informationErrorUserIsNotOn);
    }else{
      ControllerAllMethods().transitionScreen(nameRoute: Routes.RESULTS, context: context);
    }
  }
}
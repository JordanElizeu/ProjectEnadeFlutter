import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/web/controller/quiz_controller/controller_quiz.dart';
import 'package:project_enade/web/data/repository/firebase/repository_database.dart';
import 'package:project_enade/web/ui/widgets/dialog_exceptions.dart';
import 'package:project_enade/web/router/app_routes.dart';
import '../login_controller/controller_login.dart';
import '../generic_controller/controller_methods.dart';

class ControllerQuestions extends GetxController {

  Future<void> finishQuiz({@required title,@required BuildContext context,@required information,@required name,@required result,@required disciplina}) async {
    alertDialogSuccess(title: title, context: context, information: information,function: () async {
      await RepositoryDatabase().addResult(result: result, name: name, context: context, disciplina: disciplina);
      ControllerQuiz().setQuestionSelected(value: 0);
      ControllerQuiz().setShowQuestion(value: 1);
      ControllerAllMethods().pageTransition(nameRoute: Routes.INITIAL, context: context);
      Navigator.pop(ControllerLogin.contextControllerLogin);
    });
  }

  int formatQuizResponse(Map<int, Map<String, String>> map, showQuestionScreen) {
    int response;
    switch(map[showQuestionScreen]["response"]){
      case "a":
        response = 1;
        return response;
        break;
      case "b":
        response = 2;
        return response;
        break;
      case "c":
        response = 3;
        return response;
        break;
      case "d":
        response = 4;
        return response;
        break;
      case "e":
        response = 5;
        return response;
        break;
      default:
        return response;
    }
  }

  getNumberItemOfQuestion(value){
    switch (value) {
      case "A)":
        return 1;
        break;
      case "B)":
        return 2;
        break;
      case "C)":
        return 3;
        break;
      case "D)":
        return 4;
        break;
      case "E)":
        return 5;
        break;
      default:
        return "";
        break;
    }
  }
}

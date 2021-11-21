import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerQuestions extends GetxController {

  int getResponse(Map<int, Map<String, String>> map, showQuestionScreen) {
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

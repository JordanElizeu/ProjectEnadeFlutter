import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/web/data/repository/quiz/repository_quiz_network.dart';

class ControllerNetwork extends GetxController{

  getQuizNetworkMap(){
    return RepositoryQuizNetwork().getMapOfQuestionNetwork();
  }
}
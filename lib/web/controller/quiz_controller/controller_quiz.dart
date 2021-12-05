import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/web/data/repository/firebase/repository_authentication.dart';
import 'package:project_enade/web/ui/widgets/dialog_exceptions.dart';
import '../controller_questions.dart';

class ControllerQuiz extends GetxController{

  int questionSelected = 0;
  int showQuestion = 1;
  int correctResponse = 0;
  int incorrectResponse = 10;
  List<String> _listIncorrectQuestions = [];

  void addIncorrectQuestion(String incorrectQuestion){
    _listIncorrectQuestions.add(incorrectQuestion);
    update();
  }

  void setQuestionSelected({@required int value}) {
    questionSelected = value;
    update();
  }

  void setShowQuestion({@required int value}) {
    showQuestion += value;
    update();
  }

  void incrementQuestionSelected({@required int value}) {
    questionSelected += value;
    update();
  }

  void setCorrectResponse({@required int incrementQuestionCorrect}) {
    correctResponse += incrementQuestionCorrect;
    update();
  }

  void setIncorrectResponse({@required int value}) {
    incorrectResponse += value;
    update();
  }

  String getImageAds({@required Map<int, Map<String, String>> map}) {
    return map[showQuestion]["image"];
  }

  String getTitle({@required Map<int, Map<String, String>> map}) {
    return map[showQuestion]["title"];
  }

  String getItemQuestion({@required String textNumberItem, @required Map<int, Map<String, String>> map}) {
    int numberItem = ControllerQuestions().getNumberItemOfQuestion(textNumberItem);
    return map[showQuestion]["item$numberItem"];
  }

  buttonConfirmResponseForNewQuestion({@required BuildContext context, @required String disciplina, @required Map<int, Map<String, String>> map}) async {
    final _informationAlertDialogSuccess = "Questionário Finalizado!\nPara refazer o teste inicie novamente o questionario.\n\nQuestões incorretas: ${incorrectResponse - correctResponse}";
    final _titleAlertDialogSuccess = "Nota: $correctResponse de 10";
    final _titleAlertDialogFailure = "Confirme sua resposta";
    final _informationAlertDialogFailure = "Selecione um item como resposta!";

    if (questionSelected == 0) {
      alertDialogFailure(information: _informationAlertDialogFailure, context: context, title: _titleAlertDialogFailure);
    }else if (showQuestion == 10){
      Map<dynamic, dynamic> map = await RepositoryAuthentication().getInformationUser(context: context);
      final name = map["nome"];
      ControllerQuestions().questionarioFinalizado(
          title: _titleAlertDialogSuccess,
          context: context,
          result: correctResponse,
          questionSelectedRadius: questionSelected,
          showQuestionScreen: showQuestion,
          name: name,
          information: _informationAlertDialogSuccess,
          disciplina: disciplina);
    }else{
      _validatorResultQuestions(map: map);
      setQuestionSelected(value: 0);
      setShowQuestion(value: 1);
      update();
    }
  }

  //valida se acertou a questão
  _validatorResultQuestions({@required Map<int, Map<String, String>> map}){
    int response = ControllerQuestions().getResponse(map,showQuestion);
    if(response == questionSelected){
      setCorrectResponse(incrementQuestionCorrect: 1);
    }else{
      addIncorrectQuestion("Questão: $showQuestion");
      addIncorrectQuestion("Resposta: ${map[showQuestion]["response"]}");
    }
  }
}
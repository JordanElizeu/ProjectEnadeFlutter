import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:project_enade/web/controller/quiz_controller/controller_quiz.dart';

class DefaultWidgetQuestions {
  String _nameDisciplina;
  Map<int, Map<String, String>> _map;
  BuildContext _context;
  ControllerQuiz _controllerQuiz;
  BoxConstraints _boxConstraints;

  DefaultWidgetQuestions(
      {@required String nameDisciplina,
      @required Map<int, Map<String, String>> map,
      @required BuildContext context,
      @required BoxConstraints constraints,
      @required ControllerQuiz controllerQuiz}) {
    this._nameDisciplina = nameDisciplina;
    this._map = map;
    this._context = context;
    this._boxConstraints = constraints;
    this._controllerQuiz = controllerQuiz;
  }

  Widget titleQuestion() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 10.0,
      ),
      child: Container(
        width: _boxConstraints.maxWidth,
        child: Column(
          children: [
            Card(
              color: Colors.blue,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Questão ${_controllerQuiz.showQuestion} de 10",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    FittedBox(
                      child: CircularCountDownTimer(
                        duration: 900,
                        initialDuration: 0,
                        controller: CountDownController(),
                        width: _boxConstraints.maxWidth / 12,
                        height: _boxConstraints.maxHeight / 12,
                        ringColor: Colors.grey[300],
                        ringGradient: null,
                        fillColor: Colors.green,
                        fillGradient: null,
                        backgroundColor: Colors.blue,
                        backgroundGradient: null,
                        strokeWidth: 7.0,
                        strokeCap: StrokeCap.round,
                        textStyle: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textFormat: CountdownTextFormat.MM_SS,
                        isReverse: true,
                        isReverseAnimation: false,
                        isTimerTextShown: true,
                        autoStart: true,
                        onComplete: () {
                          _controllerQuiz.setQuestionSelected(value: 1);
                          _controllerQuiz.setShowQuestion(value: 10);
                          _controllerQuiz.buttonConfirmResponseForNewQuestion(
                              disciplina: _nameDisciplina,
                              context: _context,
                              map: _map);
                        },
                      ),
                    ),
                  ],
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "${_controllerQuiz.getTitle(map: _map)}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonConfirmResponse() {
    final _textButtonEncerrarQuestionario = "Encerrar questionário";
    final _textButtonConfirmar = "Confirmar";
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 5.0,
              percent: _controllerQuiz.showQuestion / 10 - 0.1,
              center: new Text(
                  "${_controllerQuiz.showQuestion - 1}${_controllerQuiz.showQuestion == 1 ? "%" : "0%"}"),
              progressColor: Colors.green,
            ),
          ),
          Container(
            width: _boxConstraints.maxWidth * 0.25,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                _controllerQuiz.buttonConfirmResponseForNewQuestion(
                  context: _context,
                  disciplina: _nameDisciplina,
                  map: _map,
                );
              },
              child: Text(
                _controllerQuiz.showQuestion == 10
                    ? _textButtonEncerrarQuestionario
                    : _textButtonConfirmar,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget radiosButton() {
    const questionOne = 1.0;
    const questionTwo = 2.0;
    const questionThree = 3.0;
    const questionFour = 4.0;
    const questionFive = 5.0;

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Column(
                children: [
                  Visibility(
                    visible:
                        _controllerQuiz.getImageAds(map: _map) != "not found",
                    child: Image.asset(
                      "${_controllerQuiz.getImageAds(map: _map)}.png",
                      height: _boxConstraints.maxHeight * 0.55,
                    ),
                  ),
                  _radio(
                    itemQuestion: "A)",
                    groupValue: questionOne,
                  ),
                  _radio(
                    itemQuestion: "B)",
                    groupValue: questionTwo,
                  ),
                  _radio(
                    itemQuestion: "C)",
                    groupValue: questionThree,
                  ),
                  _radio(
                    itemQuestion: "D)",
                    groupValue: questionFour,
                  ),
                  _radio(
                    itemQuestion: "E)",
                    groupValue: questionFive,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _radio({
    @required groupValue,
    @required String itemQuestion,
  }) {
    return LayoutBuilder(builder: (_, constraints) {
      return Container(
        child: Center(
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Radio(
                    onChanged: (value) {
                      _controllerQuiz.setQuestionSelected(value: groupValue);
                    },
                    value: _controllerQuiz.questionSelected,
                    groupValue: groupValue,
                  ),
                ),
                Container(
                  width: constraints.maxWidth * 0.90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child:
                        Text("$itemQuestion ${_controllerQuiz.getItemQuestion(
                      textNumberItem: itemQuestion,
                      map: _map,
                    )}"),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

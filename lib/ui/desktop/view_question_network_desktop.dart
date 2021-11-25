import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/controller/controller_quiz_network.dart';
import 'package:project_enade/router/Router.dart';

class ViewQuestionNetworkDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
      ControllerAllMethods()
          .transitionScreenCancelQuiz(nameRoute: Routes.INITIAL, context: context) ??
          false,
      child: GetBuilder(
        init: ControllerQuizNetwork(),
        builder: (ControllerQuizNetwork controller) {
          return Center(
            child: LayoutBuilder(
              builder: (_, constraints) {
                return SingleChildScrollView(
                  child: Container(
                    width: constraints.maxWidth * 0.80,
                    child: Card(
                      elevation: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _titleQuestion(constraints, controller, context),
                          _radiosButton(),
                          _buttonConfirmResponse(constraints, controller, context)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

Widget _titleQuestion(
    constraints,ControllerQuizNetwork controller, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10.0,
      right: 10.0,
      top: 10.0,
    ),
    child: Container(
      width: constraints.maxWidth,
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
                        "Questão ${controller.showQuestionScreenNetwork} de 10",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white),
                      ),
                      CircularCountDownTimer(
                        duration: 1800,
                        initialDuration: 0,
                        controller: CountDownController(),
                        width: constraints.maxWidth / 12,
                        height: constraints.maxHeight / 12,
                        ringColor: Colors.grey[300],
                        ringGradient: null,
                        fillColor: Colors.green,
                        fillGradient: null,
                        backgroundColor: Colors.blue,
                        backgroundGradient: null,
                        strokeWidth: 7.0,
                        strokeCap: StrokeCap.round,
                        textStyle: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textFormat: CountdownTextFormat.MM_SS,
                        isReverse: true,
                        isReverseAnimation: false,
                        isTimerTextShown: true,
                        autoStart: true,
                        onStart: () {
                          //print('Countdown Started');
                        },
                        onComplete: () {
                          controller.questionSelectedRadiusNetwork = 1;
                          controller.showQuestionScreenNetwork = 10;
                          controller.buttonConfirmResponseForNewQuestionNetwork(context);
                        },
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 25),
            child: Text(
              "${controller.getTitleNetwork()}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buttonConfirmResponse(
    constraints,ControllerQuizNetwork controller, BuildContext context) {
  final _textButtonEncerrarQuestionario = "Encerrar questionário";
  final _textButtonConfirmar = "Confirmar";

  return Padding(
    padding: const EdgeInsets.all(32.0),
    child: FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 5.0,
              percent: controller.showQuestionScreenNetwork / 10 - 0.1,
              center: new Text(
                  "${controller.showQuestionScreenNetwork - 1}${controller.showQuestionScreenNetwork == 1 ? "%" : "0%"}"),
              progressColor: Colors.green,
            ),
          ),
          Container(
            width: constraints.maxWidth * 0.25,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                controller.buttonConfirmResponseForNewQuestionNetwork(context);
              },
              child: Text(
                controller.showQuestionScreenNetwork == 10
                    ? _textButtonEncerrarQuestionario
                    : _textButtonConfirmar,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _radiosButton() {
  final questionOne = 1.0;
  final questionTwo = 2.0;
  final questionThree = 3.0;
  final questionFour = 4.0;
  final questionFive = 5.0;

  return GetBuilder(
    init: ControllerQuizNetwork(),
    builder: (ControllerQuizNetwork controller) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Column(
                children: [
                  _radio(
                      itemQuestion: "A)",
                      groupValue: questionOne,
                      controller: controller),
                  _radio(
                      itemQuestion: "B)",
                      groupValue: questionTwo,
                      controller: controller),
                  _radio(
                      itemQuestion: "C)",
                      groupValue: questionThree,
                      controller: controller),
                  _radio(
                      itemQuestion: "D)",
                      groupValue: questionFour,
                      controller: controller),
                  _radio(
                      itemQuestion: "E)",
                      groupValue: questionFive,
                      controller: controller),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

Widget _radio(
    {@required groupValue,
      @required ControllerQuizNetwork controller,
      @required String itemQuestion}) {
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
                    controller.incrementNetwork(groupValue);
                  },
                  value: controller.questionSelectedRadiusNetwork,
                  groupValue: groupValue,
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.90,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                      "$itemQuestion ${controller.getItemNetwork(itemQuestion)}"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  });
}


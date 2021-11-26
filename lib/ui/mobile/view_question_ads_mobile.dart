import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/controller/controller_quiz_ads.dart';
import 'package:project_enade/router/Router.dart';

class ViewQuestionAdsMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
      ControllerAllMethods()
          .transitionScreenCancelQuiz(nameRoute: Routes.INITIAL, context: context) ??
          false,
      child: GetBuilder(
        init: ControllerQuizAds(),
        builder: (ControllerQuizAds controller) {
          return Center(
            child: LayoutBuilder(
              builder: (_, constraints) {
                return SingleChildScrollView(
                  child: Container(
                    width: constraints.maxWidth,
                    child: Card(
                      elevation: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _titleQuestion(constraints, controller, context),
                          _radiosButton(constraints),
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
    constraints,ControllerQuizAds controller, BuildContext context) {
  return Container(
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
                      "Questão ${controller.showQuestionScreenAds} de 10",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white),
                    ),
                    FittedBox(
                      child: CircularCountDownTimer(
                        duration: 900,
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
                            fontSize: 10.0,
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
                          controller.questionSelectedRadiusAds = 1;
                          controller.showQuestionScreenAds = 10;
                          controller.buttonConfirmResponseForNewQuestionAds(context);
                        },
                      ),
                    )
                  ],
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 25),
          child: Text(
            "${controller.getTitleAds()}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buttonConfirmResponse(
    constraints,ControllerQuizAds controller, BuildContext context) {
  final _textButtonEncerrarQuestionario = "Encerrar questionário";
  final _textButtonConfirmar = "Confirmar";

  return Padding(
    padding: const EdgeInsets.only(top: 32.0,bottom: 32.0,right: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new CircularPercentIndicator(
          radius: 80.0,
          lineWidth: 5.0,
          percent: controller.showQuestionScreenAds / 10 - 0.1,
          center: new Text(
              "${controller.showQuestionScreenAds - 1}${controller.showQuestionScreenAds == 1 ? "%" : "0%"}"),
          progressColor: Colors.green,
        ),
        Container(
          width: constraints.maxWidth * 0.35,
          height: 35,
          child: ElevatedButton(
            onPressed: () {
              controller.buttonConfirmResponseForNewQuestionAds(context);
            },
            child: Text(
              controller.showQuestionScreenAds == 10
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

Widget _radiosButton(constraints) {
  final questionOne = 1.0;
  final questionTwo = 2.0;
  final questionThree = 3.0;
  final questionFour = 4.0;
  final questionFive = 5.0;

  return GetBuilder(
    init: ControllerQuizAds(),
    builder: (ControllerQuizAds controller) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10,bottom: 20.0),
            child: Column(
              children: [
                Visibility(
                    visible: controller.getImageAds() != "not found",
                    child: Image.asset("${controller.getImageAds()}.png",height: constraints.maxHeight*0.55,)
                ),
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
      );
    },
  );
}

Widget _radio(
    {@required groupValue,
      @required ControllerQuizAds controller,
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
                    controller.incrementAds(groupValue);
                  },
                  value: controller.questionSelectedRadiusAds,
                  groupValue: groupValue,
                ),
              ),
              Container(
                width: constraints.maxWidth * 0.90,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                      "$itemQuestion ${controller.getItemAds(itemQuestion)}"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  });
}

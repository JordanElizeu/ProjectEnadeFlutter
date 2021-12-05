import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_enade/web/controller/generic_controller/controller_methods.dart';
import 'package:project_enade/web/controller/quiz_controller/controller_network.dart';
import 'package:project_enade/web/controller/quiz_controller/controller_quiz.dart';
import 'package:project_enade/web/router/app_routes.dart';
import 'package:project_enade/web/ui/widgets/widgets_questions.dart';

class ViewQuestionNetworkMobile extends StatelessWidget {
  final String _titleDisciplina = "REDES";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          ControllerAllMethods().pageTransitionWhenCancelQuiz(
              nameRoute: Routes.INITIAL, context: context) ??
          false,
      child: GetBuilder(
        init: ControllerQuiz(),
        builder: (ControllerQuiz controller) {
          return Center(
            child: LayoutBuilder(
              builder: (_, constraints) {
                DefaultWidgetQuestions _defaultWidgetQuestions =
                    DefaultWidgetQuestions(
                        constraints: constraints,
                        map: ControllerNetwork().getQuizNetworkMap(),
                        nameDisciplina: _titleDisciplina,
                        context: context,
                        controllerQuiz: controller);
                return SingleChildScrollView(
                  child: Container(
                    width: constraints.maxWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _defaultWidgetQuestions.titleQuestion(),
                        _defaultWidgetQuestions.radiosButton(),
                        _defaultWidgetQuestions.buttonConfirmResponse()
                      ],
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

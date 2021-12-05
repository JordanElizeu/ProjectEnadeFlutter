import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/web/ui/widgets/dialog_exceptions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../login_controller/controller_login.dart';

class ControllerAllMethods extends GetxController {
  void openExternalUrl(
      {@required String url, @required BuildContext context}) async {
    try {
      await launch(url);
    } catch (exceptionMessage) {
      alertDialogFailure(
          context: context, title: "unknown Error", information: 404);
    }
  }

  pageTransition({@required nameRoute, @required BuildContext context}) async {
    try {
      await Get.toNamed(nameRoute);
    } catch (exceptionMessage) {
      alertDialogFailure(
          context: context, title: "unknown Error", information: 404);
    }
  }

  pageTransitionWhenCancelQuiz(
      {@required nameRoute, @required BuildContext context}) async {
    final String title = "Cancelar questionário";
    final String information =
        "Voce está prestes a cancelar o questionário, tem certeza?";
    final String nameButton = "Cancelar Questionário";
    try {
      alertDialogFailure(
          context: context,
          title: title,
          icon: Icons.warning_amber_rounded,
          information: information,
          nameButton: nameButton,
          function: () async {
            Navigator.pop(ControllerLogin.contextControllerLogin);
            await Get.toNamed(nameRoute);
          });
    } catch (exceptionMessage) {
      alertDialogFailure(
          context: context, title: "unknown Error", information: 404);
    }
  }

  validateEmail({@required String email}) {
    return EmailValidator.validate(email);
  }
}

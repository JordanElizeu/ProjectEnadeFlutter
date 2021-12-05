import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_enade/web/data/repository/firebase/repository_authentication.dart';
import '../generic_controller/controller_methods.dart';

class ControllerLogin extends GetxController {
  static TextEditingController loginTextFormFieldMatricula =
      TextEditingController();
  static TextEditingController loginTextFormFieldPassword =
      TextEditingController();
  static TextEditingController loginTextFormFieldEmail =
      TextEditingController();
  static GlobalKey<FormState> formKeyLoginPassword = GlobalKey<FormState>();
  static GlobalKey<FormState> formKeyLoginMatricula = GlobalKey<FormState>();
  static GlobalKey<FormState> formKeyLoginEmail = GlobalKey<FormState>();
  static BuildContext contextControllerLogin;

  final _textInvalidFieldMatriculaEmpty = "Preencha sua matrícula";
  final _textInvalidFieldMatricula = "Matrícula incorreta";
  final _textInvalidFieldPasswordEmpty = "Preencha sua senha";
  final _textInvalidFieldEmailEmpty = "Preencha seu e-mail";
  final _textInvalidFieldPassword = "Senha muito fraca";

  accessAccount(BuildContext context) async {
    final FormState formLoginValidatedMatricula =
        formKeyLoginMatricula.currentState;
    final FormState formLoginValidatedPassword =
        formKeyLoginPassword.currentState;
    final FormState formLoginValidatedEmail = formKeyLoginEmail.currentState;

    if (formLoginValidatedMatricula.validate() &&
        formLoginValidatedEmail.validate() &&
        formLoginValidatedPassword.validate()) {
      await RepositoryAuthentication().loginUser(
          password: loginTextFormFieldPassword.text,
          matricula: loginTextFormFieldMatricula.text,
          context: context,
          email: loginTextFormFieldEmail.text);
    }
  }

  validatorLoginFieldFormTextMatricula(String text) {
    if (text.isEmpty) {
      return _textInvalidFieldMatriculaEmpty;
    }
    if (text.length != 8) {
      return _textInvalidFieldMatricula;
    }
    return null;
  }

  validatorLoginFieldFormTextPassword(String text) {
    if (text.isEmpty) {
      return _textInvalidFieldPasswordEmpty;
    }
    if (text.length < 7) {
      return _textInvalidFieldPassword;
    }
    return null;
  }

  validatorLoginFieldFormTextEmail(String email) {
    if (email.isEmpty) {
      return _textInvalidFieldEmailEmpty;
    }
    if (!ControllerAllMethods().validateEmail(email: email)) {
      return "E-mail invalido";
    }
    return null;
  }
}

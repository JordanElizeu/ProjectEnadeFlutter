import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_enade/data/firebase.dart';
import 'controller_methods.dart';

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
    final FormState formLoginValidatedEmail =
        formKeyLoginPassword.currentState;
    final FormState formLoginValidatedSenha = formKeyLoginEmail.currentState;

    if (formLoginValidatedMatricula.validate() &&
        formLoginValidatedEmail.validate() &&
        formLoginValidatedSenha.validate()) {
      await accessAccountEnade(
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

  validatorLoginFieldFormTextEmail(String text) {
    if (text.isEmpty) {
      return _textInvalidFieldEmailEmpty;
    }
    if (!ControllerAllMethods().validatorEmail(text)) {
      return "E-mail invalido";
    }
    return null;
  }
}

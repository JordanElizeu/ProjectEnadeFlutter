import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_enade/data/firebase.dart';

import 'controller_methods.dart';

class ControllerRegister extends GetxController {
  static TextEditingController registerTextFormFieldName = TextEditingController();
  static TextEditingController registerTextFormFieldEmail = TextEditingController();
  static TextEditingController registerTextFormFieldConfirmEmail = TextEditingController();
  static TextEditingController registerTextFormFieldPassword = TextEditingController();
  static TextEditingController registerTextFormFieldConfirmPassword = TextEditingController();

  static GlobalKey<FormState> formKeyRegisterName = GlobalKey<FormState>();
  static GlobalKey<FormState> formKeyRegisterEmail = GlobalKey<FormState>();
  static GlobalKey<FormState> formKeyRegisterConfirmEmail = GlobalKey<FormState>();
  static GlobalKey<FormState> formKeyRegisterPassword = GlobalKey<FormState>();
  static GlobalKey<FormState> formKeyRegisterConfirmPassword = GlobalKey<FormState>();

  buttonRegister(BuildContext context) {
    final FormState formRegisterValidatedName =
        formKeyRegisterName.currentState;
    final FormState formRegisterValidatedEmail =
        formKeyRegisterEmail.currentState;
    final FormState formRegisterValidatedConfirmEmail =
        formKeyRegisterConfirmEmail.currentState;
    final FormState formRegisterValidatedPassword =
        formKeyRegisterPassword.currentState;
    final FormState formRegisterValidatedConfirmPassword =
        formKeyRegisterConfirmPassword.currentState;
    if (formRegisterValidatedName.validate() &&
        formRegisterValidatedEmail.validate() &&
        formRegisterValidatedConfirmEmail.validate() &&
        formRegisterValidatedPassword.validate() &&
        formRegisterValidatedConfirmPassword.validate()) {
      createNewUser(
        email: registerTextFormFieldEmail.text.toString(),
        name: registerTextFormFieldName.text,
        context: context,
        password: registerTextFormFieldPassword.text,
      );
    }
  }

  validatorRegisterFieldFormTextName(String text) {
    if (text.isEmpty) {
      return "Preencha seu nome";
    }
    return null;
  }

  validatorRegisterFieldFormTextEmail(String text) {
    if (text.isEmpty) {
      return "Preencha seu e-mail";
    }
    if (!ControllerAllMethods().validatorEmail(text)) {
      return "E-mail invalido";
    }
    return null;
  }

  validatorRegisterFieldFormTextConfirmEmail(String text) {
    if (text.isEmpty) {
      return "Preencha seu e-mail novamente";
    }
    if (text != registerTextFormFieldEmail.text) {
      return "e-mail incorreto";
    }
    return null;
  }

  validatorRegisterFieldFormTextPassword(String text) {
    if (text.isEmpty) {
      return "Preencha sua senha";
    }
    if (text.length < 7) {
      return "Senha muito fraca";
    }
    return null;
  }

  validatorRegisterFieldFormTextConfirmPassword(String text) {
    if (text.isEmpty) {
      return "Preencha novamente sua senha";
    }
    if (text != registerTextFormFieldPassword.text) {
      return "Senha não coincide";
    }
    return null;
  }
}

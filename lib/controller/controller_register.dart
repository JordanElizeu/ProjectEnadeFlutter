import 'package:email_validator/email_validator.dart';
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

  GlobalKey<FormState> formKeyRegisterName = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRegisterEmail = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRegisterConfirmEmail = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRegisterPassword = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRegisterConfirmPassword = GlobalKey<FormState>();

  buttonRegister(BuildContext context) {
    if (registerTextFormFieldConfirmPassword.text == registerTextFormFieldPassword.text) {
      print(registerTextFormFieldEmail.text);
      createNewUser(
        email: registerTextFormFieldEmail.text.toString(),
        name: registerTextFormFieldName.text,
        context: context,
        password: registerTextFormFieldPassword.text,
      );
    }else{
      formKeyRegisterConfirmPassword.currentState.printError(info: "Senha não coincide",logFunction: (){
        return registerTextFormFieldConfirmPassword.text != registerTextFormFieldPassword.text? true:false;
      });
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

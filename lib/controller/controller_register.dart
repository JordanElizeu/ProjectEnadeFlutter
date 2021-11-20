import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerRegister extends GetxController{

  TextEditingController registerTextFormFieldName = TextEditingController();
  TextEditingController registerTextFormFieldEmail = TextEditingController();
  TextEditingController registerTextFormFieldConfirmEmail = TextEditingController();
  TextEditingController registerTextFormFieldPassword = TextEditingController();
  TextEditingController registerTextFormFieldConfirmPassword = TextEditingController();

  GlobalKey<FormState> formKeyRegisterName = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRegisterEmail = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRegisterConfirmEmail = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRegisterPassword = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRegisterConfirmPassword = GlobalKey<FormState>();

  validatorEmail(String email){
    return EmailValidator.validate(email);
  }

  validatorRegisterFieldFormTextName(String text){
    if (text.isEmpty) {
      return "Preencha seu nome";
    }
    return null;
  }
  validatorRegisterFieldFormTextEmail(String text){
    if (text.isEmpty) {
      return "Preencha seu e-mail";
    }
    if (!validatorEmail(text)){
      return "E-mail invalido";
    }
    return null;
  }
  validatorRegisterFieldFormTextConfirmEmail(String text){
    if (text.isEmpty) {
      return "Preencha seu e-mail novamente";
    }
    if (text != registerTextFormFieldEmail.text){
      return "e-mail incorreto";
    }
    return null;
  }
  validatorRegisterFieldFormTextPassword(String text){
    if (text.isEmpty) {
      return "Preencha sua senha";
    }
    if (text.length < 7){
      return "Senha muito fraca";
    }
    return null;
  }
  validatorRegisterFieldFormTextConfirmPassword(String text){
    if (text.isEmpty) {
      return "Preencha novamente sua senha";
    }
    if (text != registerTextFormFieldPassword.text){
      return "Senha não coincide";
    }
    return null;
  }
}

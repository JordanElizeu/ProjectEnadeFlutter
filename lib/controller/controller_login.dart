import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_enade/components/dialog_exceptions.dart';
import 'package:project_enade/data/firebase.dart';

class ControllerLogin extends GetxController{

  static TextEditingController loginTextFormFieldMatricula = TextEditingController();
  static TextEditingController loginTextFormFieldPassword = TextEditingController();
  GlobalKey<FormState> formKeyLoginPassword = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyLoginMatricula = GlobalKey<FormState>();

  final _textInvalidFieldMatriculaEmpty = "Preencha sua matrícula";
  final _textInvalidFieldMatricula = "Matrícula incorreta";
  final _textInvalidFieldPasswordEmpty = "Preencha sua senha";
  final _textInvalidFieldPassword = "Senha muito fraca";

  accessAccount(BuildContext context) async{
    if(loginTextFormFieldMatricula.text.length == 8 && loginTextFormFieldPassword.text.length > 6){
      accessAccountEnade(password: loginTextFormFieldPassword.text, matricula: loginTextFormFieldMatricula.text, context: context);
    }else{
      alertDialogFailure(information: "Preencha os campos corretamente.", context: context, title: null);
    }
  }

  validatorLoginFieldFormTextMatricula(String text){
    if (text.isEmpty) {
      return _textInvalidFieldMatriculaEmpty;
    }
    if (text.length != 8){
      return _textInvalidFieldMatricula;
    }
    return null;
  }
  validatorLoginFieldFormTextPassword(String text){
    if (text.isEmpty) {
      return _textInvalidFieldPasswordEmpty;
    }
    if (text.length < 7){
      return _textInvalidFieldPassword;
    }
    return null;
  }
}


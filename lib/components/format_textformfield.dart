import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget formatTextField(
    {@required fieldName,
      @required IconData iconData,
      @required bool obscureText,
      @required Function(String text) function,
      @required GlobalKey<FormState> globalKey,
      @required FilteringTextInputFormatter filteringTextInputFormatter,
      @required maxLength,
      @required TextEditingController textEditingController}) {
  return TextFormField(
    controller: textEditingController,
    maxLength: maxLength,
    textAlignVertical: TextAlignVertical.top,
    onChanged: (value) {
      _showErrorFieldText(globalKey);
    },
    validator: (text) {
      return function(text);
    },
    // mudei digitsonly para static
    inputFormatters: <TextInputFormatter>[filteringTextInputFormatter == null? FilteringTextInputFormatter.singleLineFormatter:filteringTextInputFormatter],
    decoration: InputDecoration(
      labelText: fieldName,
      icon: Icon(iconData),
    ),
    obscureText: obscureText,
  );
}

_showErrorFieldText(GlobalKey<FormState> globalKey){
  final FormState formRegisterValidated = globalKey.currentState;
  formRegisterValidated.validate();
}
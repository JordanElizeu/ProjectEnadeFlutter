import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_enade/web/ui/widgets/format_textformfield.dart';
import 'package:project_enade/web/ui/widgets/inkwell.dart';
import 'package:project_enade/web/controller/controller_methods.dart';
import 'package:project_enade/web/controller/controller_register.dart';
import 'package:project_enade/web/router/app_routes.dart';

class ViewRegisterMobile extends StatelessWidget {
  final String _fieldName = "Nome";
  final String _fieldEmail = "E-mail";
  final String _fieldConfirmEmail = "Confirmar E-mail";
  final String _fieldPassword = "Senha";
  final String _fieldConfirmPassword = "Confirmar Senha";
  final String _buttonNameRegister = "Cadastrar";
  final String _textQuestionUserHasAccount = "Já possui uma conta?";
  final String _linkNameToPageLogin = "Entrar";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
      ControllerAllMethods()
          .transitionScreen(nameRoute: Routes.LOGIN, context: context) ??
          false,
      child: Center(
        child: Material(
          child: LayoutBuilder(builder: (_, constraints) {
            return Container(
                width: constraints.maxWidth,
                child: GetBuilder(
                  init: ControllerRegister(),
                  builder: (ControllerRegister controller) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/gov.png",
                                  height: constraints.maxHeight * 0.15,
                                ),
                                Text(
                                  "Crie sua conta para continuar",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            Form(
                              key: ControllerRegister.formKeyRegisterName,
                              child: formatTextField(
                                  iconData: Icons.person,
                                  fieldName: _fieldName,
                                  obscureText: false,
                                  function: (text) {
                                    return controller
                                        .validatorRegisterFieldFormTextName(
                                        text);
                                  },
                                  globalKey: ControllerRegister.formKeyRegisterName,
                                  filteringTextInputFormatter: null,
                                  maxLength: 20,
                                  textEditingController: ControllerRegister.registerTextFormFieldName),
                            ),
                            Form(
                              key: ControllerRegister.formKeyRegisterEmail,
                              child: formatTextField(
                                  iconData: Icons.email,
                                  fieldName: _fieldEmail,
                                  obscureText: false,
                                  function: (String text) {
                                    return controller
                                        .validatorRegisterFieldFormTextEmail(
                                        text);
                                  },
                                  globalKey: ControllerRegister.formKeyRegisterEmail,
                                  maxLength: null,
                                  filteringTextInputFormatter: null,
                                  textEditingController: ControllerRegister.registerTextFormFieldEmail),
                            ),
                            Form(
                              key: ControllerRegister.formKeyRegisterConfirmEmail,
                              child: formatTextField(
                                  iconData: Icons.email,
                                  fieldName: _fieldConfirmEmail,
                                  obscureText: false,
                                  function: (String text) {
                                    return controller
                                        .validatorRegisterFieldFormTextConfirmEmail(
                                        text);
                                  },
                                  globalKey:
                                  ControllerRegister.formKeyRegisterConfirmEmail,
                                  filteringTextInputFormatter: null,
                                  maxLength: null,
                                  textEditingController: ControllerRegister.registerTextFormFieldConfirmEmail),
                            ),
                            Form(
                              key: ControllerRegister.formKeyRegisterPassword,
                              child: formatTextField(
                                  iconData: Icons.lock,
                                  fieldName: _fieldPassword,
                                  obscureText: true,
                                  function: (String text) {
                                    return controller
                                        .validatorRegisterFieldFormTextPassword(
                                        text);
                                  },
                                  globalKey: ControllerRegister.formKeyRegisterPassword,
                                  filteringTextInputFormatter: null,
                                  maxLength: null,
                                  textEditingController: ControllerRegister.registerTextFormFieldPassword),
                            ),
                            Form(
                              key: ControllerRegister.formKeyRegisterConfirmPassword,
                              child: formatTextField(
                                  iconData: Icons.lock,
                                  fieldName: _fieldConfirmPassword,
                                  obscureText: true,
                                  function: (String text) {
                                    return controller
                                        .validatorRegisterFieldFormTextConfirmPassword(
                                        text);
                                  },
                                  globalKey:
                                  ControllerRegister.formKeyRegisterConfirmPassword,
                                  maxLength: null,
                                  filteringTextInputFormatter: null,
                                  textEditingController: ControllerRegister.registerTextFormFieldConfirmPassword),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Container(
                                    height: 35,
                                    width: constraints.maxWidth * 0.50,
                                    child: ElevatedButton(
                                      onPressed: () {ControllerRegister().buttonRegister(context);},
                                      child: Text(_buttonNameRegister),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(_textQuestionUserHasAccount),
                                      inkwellText(
                                          textName: _linkNameToPageLogin,
                                          function: () {
                                            ControllerAllMethods().transitionScreen(
                                                nameRoute: Routes.LOGIN,
                                                context: context);
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ));
          }),
        ),
      ),
    );
  }
}

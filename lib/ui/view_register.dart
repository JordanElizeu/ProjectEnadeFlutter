import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_enade/components/format_textformfield.dart';
import 'package:project_enade/components/inkwell.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/controller/controller_register.dart';
import 'package:project_enade/router/Router.dart';

class ViewRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          ControllerAllMethods()
              .transitionScreen(nameRoute: Routes.LOGIN, context: context) ??
          false,
      child: Center(
        child: Material(
          elevation: 20,
          child: LayoutBuilder(builder: (_, constraints) {
            return Container(
                width: constraints.maxWidth * 0.45 < 350
                    ? constraints.maxWidth * 0.70
                    : constraints.maxWidth * 0.45,
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
                              key: controller.formKeyRegisterName,
                              child: formatTextField(
                                  iconData: Icons.person,
                                  fieldName: "Nome",
                                  obscureText: false,
                                  function: (text) {
                                    return controller
                                        .validatorRegisterFieldFormTextName(
                                            text);
                                  },
                                  globalKey: controller.formKeyRegisterName,
                                  filteringTextInputFormatter: null,
                                  maxLength: 20,
                                  controller: controller.registerTextFormFieldName),
                            ),
                            Form(
                              key: controller.formKeyRegisterEmail,
                              child: formatTextField(
                                  iconData: Icons.email,
                                  fieldName: "E-mail",
                                  obscureText: false,
                                  function: (String text) {
                                    return controller
                                        .validatorRegisterFieldFormTextEmail(
                                            text);
                                  },
                                  globalKey: controller.formKeyRegisterEmail,
                                  maxLength: null,
                                  filteringTextInputFormatter: null,
                                  controller: controller.registerTextFormFieldEmail),
                            ),
                            Form(
                              key: controller.formKeyRegisterConfirmEmail,
                              child: formatTextField(
                                  iconData: Icons.email,
                                  fieldName: "Confirmar E-mail",
                                  obscureText: false,
                                  function: (String text) {
                                    return controller
                                        .validatorRegisterFieldFormTextConfirmEmail(
                                            text);
                                  },
                                  globalKey:
                                      controller.formKeyRegisterConfirmEmail,
                                  filteringTextInputFormatter: null,
                                  maxLength: null,
                                  controller: controller.registerTextFormFieldConfirmEmail),
                            ),
                            Form(
                              key: controller.formKeyRegisterPassword,
                              child: formatTextField(
                                  iconData: Icons.lock,
                                  fieldName: "Senha",
                                  obscureText: true,
                                  function: (String text) {
                                    return controller
                                        .validatorRegisterFieldFormTextPassword(
                                            text);
                                  },
                                  globalKey: controller.formKeyRegisterPassword,
                                  filteringTextInputFormatter: null,
                                  maxLength: null,
                                  controller: controller.registerTextFormFieldPassword),
                            ),
                            Form(
                              key: controller.formKeyRegisterConfirmPassword,
                              child: formatTextField(
                                  iconData: Icons.lock,
                                  fieldName: "Confirmar Senha",
                                  obscureText: true,
                                  function: (String text) {
                                    return controller
                                        .validatorRegisterFieldFormTextConfirmPassword(
                                            text);
                                  },
                                  globalKey:
                                      controller.formKeyRegisterConfirmPassword,
                                  maxLength: null,
                                  filteringTextInputFormatter: null,
                                  controller: controller.registerTextFormFieldConfirmPassword),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Container(
                                height: 35,
                                width: constraints.maxWidth * 0.30,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Cadastrar"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Já possui uma conta?"),
                                  inkwellText(
                                      textName: "Entrar",
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

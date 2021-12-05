import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_enade/web/ui/widgets/format_textformfield.dart';
import 'package:project_enade/web/ui/widgets/inkwell.dart';
import 'package:project_enade/web/controller/controller_login.dart';
import 'package:project_enade/web/controller/controller_methods.dart';
import 'package:project_enade/web/router/app_routes.dart';
import '../view_login.dart';

class ViewLoginMobile extends StatelessWidget {
  final ViewLogin _viewLogin = ViewLogin();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          ControllerAllMethods()
              .transitionScreen(nameRoute: Routes.INITIAL, context: context) ??
          false,
      child: Center(
        child: Material(
            child: LayoutBuilder(
              builder: (_, constraints) {
                return Container(
                    //I want to get 40% of screen so...
                    width: constraints.maxWidth,
                    child: GetBuilder(
                      init: ControllerLogin(),
                      builder: (ControllerLogin controller) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/gov.png",
                                          height: constraints.maxHeight * 0.15,
                                        ),
                                        Text(
                                          _viewLogin.titleLogin,
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ],
                                    )),
                                Form(
                                  key: ControllerLogin.formKeyLoginEmail,
                                  child: formatTextField(
                                    maxLength: null,
                                    fieldName: _viewLogin.campoEmail,
                                    globalKey:
                                        ControllerLogin.formKeyLoginEmail,
                                    filteringTextInputFormatter: null,
                                    iconData: Icons.email,
                                    function: (String text) {
                                      return controller
                                          .validatorLoginFieldFormTextEmail(
                                              text);
                                    },
                                    textEditingController:
                                        ControllerLogin.loginTextFormFieldEmail,
                                    obscureText: false,
                                  ),
                                ),
                                Form(
                                  key: ControllerLogin.formKeyLoginPassword,
                                  child: formatTextField(
                                    maxLength: null,
                                    fieldName: _viewLogin.campoSenha,
                                    globalKey:
                                        ControllerLogin.formKeyLoginPassword,
                                    filteringTextInputFormatter: null,
                                    iconData: Icons.lock,
                                    obscureText: true,
                                    function: (String text) {
                                      return controller
                                          .validatorLoginFieldFormTextPassword(
                                              text);
                                    },
                                    textEditingController: ControllerLogin
                                        .loginTextFormFieldPassword,
                                  ),
                                ),
                                Form(
                                  key: ControllerLogin.formKeyLoginMatricula,
                                  child: formatTextField(
                                    maxLength: 8,
                                    fieldName: _viewLogin.campoMatricula,
                                    globalKey:
                                        ControllerLogin.formKeyLoginMatricula,
                                    filteringTextInputFormatter:
                                        FilteringTextInputFormatter.digitsOnly,
                                    iconData: Icons.person,
                                    obscureText: false,
                                    function: (String text) {
                                      return controller
                                          .validatorLoginFieldFormTextMatricula(
                                              text);
                                    },
                                    textEditingController: ControllerLogin
                                        .loginTextFormFieldMatricula,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Text(
                                      _viewLogin.campoEsqueciSenha,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 48.0),
                                      child: Container(
                                        width: constraints.maxWidth * 0.50,
                                        height: 35,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            alignment: Alignment.centerRight,
                                          ),
                                          onPressed: () {
                                            ControllerLogin()
                                                .accessAccount(context);
                                          },
                                          child: Center(
                                            child: Text(
                                                _viewLogin.textButtonLogin),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(_viewLogin.textEsqueciSenha),
                                          inkwellText(
                                              textName: _viewLogin
                                                  .textEsqueciSenhaLink,
                                              function: () {
                                                ControllerAllMethods()
                                                    .transitionScreen(
                                                        nameRoute:
                                                            Routes.REGISTER,
                                                        context: context);
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ));
              },
            )),
      ),
    );
  }
}

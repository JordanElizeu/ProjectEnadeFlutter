import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_enade/components/format_textformfield.dart';
import 'package:project_enade/components/inkwell.dart';
import 'package:project_enade/controller/controller_login.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/router/Router.dart';

class ViewLogin extends StatelessWidget {
  final _titleLogin = "Acesse sua conta";
  final _campoMatricula = "Matrícula";
  final _campoSenha = "Senha";
  final _campoEmail = "E-mail";
  final _textEsqueciSenha = "Não possui conta?";
  final _textEsqueciSenhaLink = "Cadastre-se";
  final _campoEsqueciSenha = "Esqueci minha senha?";
  final _textButtonLogin = "Entrar";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          ControllerAllMethods()
              .transitionScreen(nameRoute: Routes.INITIAL, context: context) ??
          false,
      child: Center(
        child: Material(
            elevation: 20,
            child: LayoutBuilder(
              builder: (_, constraints) {
                return Container(
                    //I want to get 37% of screen so...
                    width: constraints.maxWidth * 0.37 < 350
                        ? constraints.maxWidth * 0.70
                        : constraints.maxWidth * 0.37,
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
                                          _titleLogin,
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ],
                                    )),
                                Form(
                                  key: ControllerLogin.formKeyLoginEmail,
                                  child: formatTextField(
                                    maxLength: null,
                                    fieldName: _campoEmail,
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
                                    fieldName: _campoSenha,
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
                                    fieldName: _campoMatricula,
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
                                      _campoEsqueciSenha,
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
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          alignment: Alignment.centerRight,
                                        ),
                                        onPressed: () {
                                          //button of login
                                          ControllerLogin()
                                              .accessAccount(context);
                                        },
                                        child: Container(
                                          width: constraints.maxWidth * 0.14,
                                          height: 35,
                                          child: Center(
                                            child: Text(_textButtonLogin),
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
                                          Text(_textEsqueciSenha),
                                          inkwellText(
                                              textName: _textEsqueciSenhaLink,
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

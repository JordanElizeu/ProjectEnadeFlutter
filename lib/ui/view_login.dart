import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_enade/components/format_textformfield.dart';
import 'package:project_enade/components/inkwell.dart';
import 'package:project_enade/controller/controller_login.dart';
import 'package:project_enade/controller/controller_methods.dart';
import 'package:project_enade/router/Router.dart';
import 'package:project_enade/screen/responsive.dart';
import 'desktop/view_login_desktop.dart';
import 'mobile/view_login_mobile.dart';

class ViewLogin extends StatelessWidget {
  final titleLogin = "Acesse sua conta";
  final campoMatricula = "Matrícula";
  final campoSenha = "Senha";
  final campoEmail = "E-mail";
  final textEsqueciSenha = "Não possui conta?";
  final textEsqueciSenhaLink = "Cadastre-se";
  final campoEsqueciSenha = "Esqueci minha senha?";
  final textButtonLogin = "Entrar";

  @override
  Widget build(BuildContext context) {
    final screen = getFormFactor(context).toString();
    if(screen == "ScreenType.Phone"){
      return ViewLoginMobile();
    }else{
      return ViewLoginDesktop();
    }
  }

  Widget customDesignViewLogin(BuildContext context,{@required double width}){
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
                  //I want to get 40% of screen so...
                    width: width,
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
                                          titleLogin,
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ],
                                    )),
                                Form(
                                  key: ControllerLogin.formKeyLoginEmail,
                                  child: formatTextField(
                                    maxLength: null,
                                    fieldName: campoEmail,
                                    globalKey: ControllerLogin.formKeyLoginEmail,
                                    filteringTextInputFormatter: null,
                                    iconData: Icons.email,
                                    function: (String text) {
                                      return controller
                                          .validatorLoginFieldFormTextEmail(text);
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
                                    fieldName: campoSenha,
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
                                    fieldName: campoMatricula,
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
                                      campoEsqueciSenha,
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
                                          ControllerLogin()
                                              .accessAccount(context);
                                        },
                                        child: Container(
                                          width: constraints.maxWidth * 0.14,
                                          height: 35,
                                          child: Center(
                                            child:
                                            Text(textButtonLogin),
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
                                          Text(textEsqueciSenha),
                                          inkwellText(
                                              textName:
                                              textEsqueciSenhaLink,
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

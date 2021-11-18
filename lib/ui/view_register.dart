import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/controller/controller.dart';
import 'package:project_enade/router/Router.dart';

import 'app_bar.dart';

class ViewRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Controller().onBackPressed(nameRouter: Routes.INITIAL, context: context),
      child: Center(
        child: Material(
          elevation: 20,
          child: LayoutBuilder(builder: (_, constraints) {
            return Container(
              width: constraints.maxWidth * 0.45 < 300
                  ? constraints.maxWidth * 0.70
                  : constraints.maxWidth * 0.45,
              child: SingleChildScrollView(
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
                                "Crie sua conta para continuar",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          )),
                      _formatTextField(iconData: Icons.person, fieldName: "Nome", obscureText: false),
                      _formatTextField(
                          iconData: Icons.email, fieldName: "E-mail", obscureText: false),
                      _formatTextField(
                          iconData: Icons.email, fieldName: "Confirmar E-mail", obscureText: false),
                      _formatTextField(iconData: Icons.lock, fieldName: "Senha", obscureText: true),
                      _formatTextField(
                          iconData: Icons.lock, fieldName: "Confirmar Senha", obscureText: true),
                      Padding(
                        padding: const EdgeInsets.only(top: 56),
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
                                  Controller().transitionScreen(nameRoute: Routes.LOGIN, context: context);
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

Widget _formatTextField({@required fieldName, @required IconData iconData, @required bool obscureText}) {
  return TextField(
    decoration: InputDecoration(
      labelText: fieldName,
      icon: Icon(iconData),
    ),
    obscureText: obscureText,
  );
}
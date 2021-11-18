import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:project_enade/controller/controller.dart';
import 'package:project_enade/router/Router.dart';
import 'package:project_enade/ui/initial_page.dart';
import 'app_bar.dart';

class ViewLogin extends StatelessWidget {
  final _titleLogin = "Acesse sua conta";
  final _campoMatricula = "Matrícula";
  final _campoSenha = "Senha";
  final _campoEsqueciSenha = "Esqueci minha senha?";
  final _textButtonLogin = "Entrar";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Controller().transitionScreen(nameRoute: Routes.INITIAL, context: context)??false,
      child: Center(
        child: Material(
            elevation: 20,
            child: LayoutBuilder(
              builder: (_, constraints) {
                return Container(
                  //I want to get 37% of screen so...
                  width: constraints.maxWidth * 0.37 < 300
                      ? constraints.maxWidth * 0.70
                      : constraints.maxWidth * 0.37,
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
                                    _titleLogin,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              )),
                          _formatTextField(
                            filteringTextInputFormatter:
                                FilteringTextInputFormatter.digitsOnly,
                            fieldName: _campoMatricula,
                            textInputType: TextInputType.number,
                            maxLength: 8,
                            obscuredText: false,
                          ),
                          _formatTextField(
                            filteringTextInputFormatter:
                                FilteringTextInputFormatter.singleLineFormatter,
                            fieldName: _campoSenha,
                            textInputType: TextInputType.text,
                            maxLength: null,
                            obscuredText: true,
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
                                  onPressed: () {},
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Não possui conta?"),
                                    inkwellText(
                                        textName: "Cadastre-se",
                                        function: () {
                                          Controller().transitionScreen(
                                              nameRoute: Routes.REGISTER,
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
                  ),
                );
              },
            )),
      ),
    );
  }
}

Widget _formatTextField(
    {@required FilteringTextInputFormatter filteringTextInputFormatter,
    @required fieldName,
    @required TextInputType textInputType,
    @required maxLength,
    @required bool obscuredText}) {
  return LayoutBuilder(
    builder: (_, constraints) {
      return Container(
        width: constraints.maxWidth * 0.70,
        child: TextField(
          maxLength: maxLength,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.left,
          obscureText: obscuredText,
          keyboardType: textInputType,
          inputFormatters: <TextInputFormatter>[filteringTextInputFormatter],
          decoration: InputDecoration(
            labelText: fieldName,
          ),
        ),
      );
    },
  );
}

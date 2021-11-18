import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class ViewLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
            elevation: 20,
            child: LayoutBuilder(
              builder: (_, constraints){
                return Container(
                  //I want to get 35% of screen so...
                  width: constraints.maxWidth*0.70,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text(
                              "Acesse sua conta",
                              style: TextStyle(fontSize: 24.0, color: Colors.black),
                            ),
                          ),
                          _formatTextField(
                            filteringTextInputFormatter:
                            FilteringTextInputFormatter.digitsOnly,
                            fieldName: "Matrícula",
                            textInputType: TextInputType.number,
                            maxLength: 8,
                            obscuredText: false,
                          ),
                          _formatTextField(
                            filteringTextInputFormatter:
                            FilteringTextInputFormatter.singleLineFormatter,
                            fieldName: "Senha",
                            textInputType: TextInputType.text,
                            maxLength: null,
                            obscuredText: true,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  "Esqueci minha senha?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 64.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    alignment: Alignment.centerRight,
                                  ),
                                  onPressed: () {},
                                  child: Container(
                                    width: constraints.maxWidth*0.2,
                                    height: 35,
                                    child: Center(
                                      child: Text("Entrar"),
                                    ),
                                  ),
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
            )
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
  return TextField(
    maxLength: maxLength,
    style: TextStyle(fontSize: 16),
    textAlign: TextAlign.left,
    obscureText: obscuredText,
    keyboardType: textInputType,
    inputFormatters: <TextInputFormatter>[filteringTextInputFormatter],
    decoration: InputDecoration(
      labelText: fieldName,
    ),
  );
}

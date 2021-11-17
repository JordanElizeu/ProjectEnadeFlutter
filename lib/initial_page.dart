import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InitialPage extends StatelessWidget {
  static const _title =
      "Enade - Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira";
  static const _buttonLogin = "Entrar";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, home: appBar());
  }

  Widget appBar() {
    return Scaffold(
      body: Material(
        elevation: 20,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "images/enade.jfif",
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    "images/gov.png",
                    height: 100,
                  ),
                ),
                Container(
                  height: 35,
                  width: 120,
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        _buttonLogin,
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        mouseCursor:
                            MaterialStateProperty.all(MouseCursor.defer),
                        elevation: MaterialStateProperty.all(7),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

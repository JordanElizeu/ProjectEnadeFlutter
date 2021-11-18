import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_enade/router/Router.dart';
import 'package:project_enade/ui/initial_page.dart';
import 'package:project_enade/ui/view_login.dart';
import 'package:project_enade/ui/view_register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _title = "Enade - Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home:MaterialApp(
        initialRoute: "/",
        routes: {
          '/': (_) => InitialPage(),
          '/login': (_) => ViewLogin(),
          '/register': (_) => ViewRegister(),
        },
      ),
    );
  }
}


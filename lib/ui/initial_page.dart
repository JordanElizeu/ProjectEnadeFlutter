import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/ui/view_footer.dart';
import 'package:project_enade/ui/view_login.dart';

import 'app_bar.dart';

class InitialPage extends StatelessWidget {
  static const _title = "Enade - Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              appBar(),
              ViewLogin(),
              ViewFooter()
            ],
          ),
        ),
      ),
    );
  }
}

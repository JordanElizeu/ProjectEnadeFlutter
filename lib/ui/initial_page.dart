import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_enade/ui/view_body_initialpage.dart';
import 'package:project_enade/ui/view_footer.dart';
import 'app_bar.dart';

class InitialPage extends StatelessWidget {
  final _titleCardQuiz = "Enade - Quiz 2021 ";
  final _twoTitleCardQuiz = "ADS e REDES";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (_, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ViewAppBar(),
              Image.asset("assets/images/logo_enade.png"),
              Container(
                width: constraints.maxWidth * 0.70,
                height: constraints.maxHeight*0.10,
                child: Card(
                    color: Colors.blue,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _formatText(_titleCardQuiz.toString(), FontWeight.bold),
                        _formatText(_twoTitleCardQuiz, FontWeight.normal),
                      ],
                    )),
              ),
              ViewBodyInitialPage(),
              ViewFooter(),
            ],
          ),
        );
      },
    ));
  }
}

Widget _formatText(title, FontWeight fontWeight) {
  return Text(
    title,
    style: TextStyle(color: Colors.white, fontWeight: fontWeight),
  );
}

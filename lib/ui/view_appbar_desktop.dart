import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/ui/view_body_initial.dart';
import 'package:project_enade/ui/view_footer.dart';
import 'app_bar.dart';

class ViewPageDesktop extends StatelessWidget {
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
              Container(
                  child: ViewAppBar(),
                height: constraints.maxHeight*0.15,
                width: constraints.maxWidth,
              ),
              Image.asset("assets/images/logo_enade.png"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: constraints.maxWidth * 0.80,
                  height: constraints.maxHeight * 0.10,
                  child: Card(
                      color: Colors.blue,
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _formatText(_titleCardQuiz.toString(), FontWeight.bold),
                              _formatText(_twoTitleCardQuiz, FontWeight.normal),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
              Container(
                  child: ViewBodyInitialPage(),
                height: constraints.maxHeight*0.60,
              ),
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

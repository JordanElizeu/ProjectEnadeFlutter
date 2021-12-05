import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/ui/desktop/body_desktop/view_bodyinitial_desktop.dart';
import 'package:project_enade/web/ui/desktop/footer_desktop/view_footer_desktop.dart';
import '../widgets/app_bar_tablet_or_desktop.dart';

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
              Image.asset("assets/images/banner_enade.png",height: constraints.maxHeight*0.50,),
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
              Padding(
                padding: const EdgeInsets.only(top: 32.0,bottom: 32.0),
                child: Container(
                    child: ViewBodyInitialPage(),
                ),
              ),
              ViewFooterDesktop(),
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

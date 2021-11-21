import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:project_enade/controller/controller_initialpage.dart';
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
              _bodyInitialPage(context),
              ViewFooter(),
            ],
          ),
        );
      },
    ));
  }
}

Widget _bodyInitialPage(BuildContext context) {
  final _titleCardItemAds = "10 Questões - ADS";
  final _titleCardItemResults = "Resultados";
  final _titleCardItemNetwork = "10 Questões - REDES";

  final List<CardItem> items = [
    _iconTitleCardItem(_titleCardItemAds, Icons.computer),
    _iconTitleCardItem(_titleCardItemResults, Icons.account_tree_outlined),
    _iconTitleCardItem(_titleCardItemNetwork, Icons.alternate_email),
  ];
  return LayoutBuilder(
    builder: (_, constraints) {
      return Container(
        alignment: Alignment.center,
        width: constraints.maxWidth,
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0, bottom: 80.0),
          child: Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HorizontalCardPager(
                  initialPage: 1,
                  onSelectedItem: (page) => ControllerInitialPage().selectedQuizOrResults(page,context),
                  items: items, // set ImageCardItem or IconTitleCardItem class
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

IconTitleCardItem _iconTitleCardItem(title, IconData icon) {
  return IconTitleCardItem(
    text: title,
    iconData: icon,
  );
}

Widget _formatText(title, FontWeight fontWeight) {
  return Text(
    title,
    style: TextStyle(color: Colors.white, fontWeight: fontWeight),
  );
}

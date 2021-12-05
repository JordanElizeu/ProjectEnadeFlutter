import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:project_enade/web/controller/initialpage_controller/controller_initialpage_desktop.dart';

class ViewBodyInitialPage extends StatelessWidget {
  //Strings
  final buttonLogin = "Entrar";
  final linkAccessibility = "https://www.gov.br/governodigital/pt-br/acessibilidade-digital";
  final titleAccessibilityLink = "Acessibilidade";
  final titleResultsLink = "Resultados";
  final _titleCardItemAds = "10 Questões - ADS";
  final _titleCardItemResults = "Resultados";
  final _titleCardItemNetwork = "10 Questões - REDES";

  @override
  Widget build(BuildContext context) {
    final List<CardItem> items = [
      iconTitleCardItem(title: _titleCardItemAds,icon: Icons.computer),
      iconTitleCardItem(title: _titleCardItemResults,icon: Icons.data_usage_rounded),
      iconTitleCardItem(title: _titleCardItemNetwork,icon: Icons.connected_tv),
    ];

    return LayoutBuilder(
      builder: (_, constraints) {
        return Container(
          alignment: Alignment.center,
          child: Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HorizontalCardPager(
                  initialPage: 1,
                  onSelectedItem: (page) => ControllerInitialPageDesktop().selectedQuizOrResults(page,context),
                  items: items, // set ImageCardItem or IconTitleCardItem class
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

IconTitleCardItem iconTitleCardItem({title,IconData icon}) {
  return IconTitleCardItem(
    text: title,
    iconData: icon,
  );
}
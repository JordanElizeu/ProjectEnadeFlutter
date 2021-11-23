import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:project_enade/controller/controller_initialpage.dart';

import '../view_body_initialpage.dart';

Widget bodyInitialPageTablet(BuildContext context) {
  final List<CardItem> itemsCard = [
    ViewBodyInitialPage().iconTitleCardItem(title: " ",icon: Icons.computer),
    ViewBodyInitialPage().iconTitleCardItem(title: " ",icon: Icons.account_tree_outlined),
    ViewBodyInitialPage().iconTitleCardItem(title: " ",icon: Icons.alternate_email),
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
                  items: itemsCard, // set ImageCardItem or IconTitleCardItem class
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
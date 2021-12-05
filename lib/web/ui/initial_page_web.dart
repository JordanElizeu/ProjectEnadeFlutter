import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_enade/web/ui/widgets/responsive.dart';
import 'package:project_enade/web/ui/desktop/page_initial_desktop.dart';
import 'mobile/appbar_mobile.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = getFormFactor(context).toString();
    if(screen == "ScreenType.Tablet"){
      return ViewPageDesktop();
    }else if (screen == "ScreenType.Phone"){
      return ViewPageMobile();
    }
    return ViewPageDesktop();
  }
}

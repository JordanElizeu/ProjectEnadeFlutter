import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_enade/screen/responsive.dart';
import 'package:project_enade/ui/desktop/view_appbar_desktop.dart';
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

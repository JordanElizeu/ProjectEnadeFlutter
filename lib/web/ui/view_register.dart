import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/ui/widgets/responsive.dart';
import 'desktop/view_register_desktop.dart';
import 'mobile/view_register_mobile.dart';

class ViewRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = getFormFactor(context).toString();
    if(screen == "ScreenType.Phone"){
      return ViewRegisterMobile();
    }else{
      return ViewRegisterDesktop();
    }
  }
}


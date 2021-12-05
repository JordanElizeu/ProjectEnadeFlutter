import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/ui/desktop/register_desktop/view_register_desktop.dart';
import 'package:project_enade/web/ui/mobile/register_mobile/view_register_mobile.dart';
import 'package:project_enade/web/ui/widgets/responsive.dart';

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


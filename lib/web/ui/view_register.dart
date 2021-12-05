import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/ui/desktop/register_desktop/view_register_desktop.dart';
import 'package:project_enade/web/ui/mobile/register_mobile/view_register_mobile.dart';
import 'package:project_enade/web/ui/tablet/register_tablet/view_register_tablet.dart';
import 'package:project_enade/web/ui/widgets/responsive.dart';

class ViewRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = getFormFactor(context).toString();
    final width = MediaQuery.of(context).size.width;

    switch (screen){
      case 'ScreenType.Phone':
        return ViewRegisterMobile();
        break;
      default:
        if (width * 0.40 < 320){
          return ViewRegisterTablet();
        }else{
          return ViewRegisterDesktop();
        }
        break;
    }
  }
}


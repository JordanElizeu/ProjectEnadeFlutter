import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/screen/responsive.dart';
import 'package:project_enade/ui/desktop/view_question_network_desktop.dart';
import 'package:project_enade/ui/mobile/view_question_network_mobile.dart';

class ViewQuestionsNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = getFormFactor(context).toString();
    if(screen == "ScreenType.Phone"){
      return ViewQuestionNetworkMobile();
    }else{
      return ViewQuestionNetworkDesktop();
    }
  }
}


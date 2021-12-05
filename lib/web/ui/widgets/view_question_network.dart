import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/ui/desktop/quiz_desktop/view_question_network_desktop.dart';
import 'package:project_enade/web/ui/mobile/quiz_mobile/view_question_network_mobile.dart';
import 'package:project_enade/web/ui/widgets/responsive.dart';

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


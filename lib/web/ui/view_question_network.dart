import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/ui/mobile/quiz_mobile/view_question_network_mobile.dart';
import 'package:project_enade/web/ui/tablet/quiz_tablet/view_question_network_tablet.dart';
import 'package:project_enade/web/ui/widgets/responsive.dart';
import 'desktop/quiz_desktop/view_question_network_desktop.dart';

class ViewQuestionsNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = getFormFactor(context).toString();
    final width = MediaQuery.of(context).size.width;

    switch (screen){
      case 'ScreenType.Phone':
        return ViewQuestionNetworkMobile();
        break;
      default:
        if (width * 0.40 < 320){
          return ViewQuestionNetworkTablet();
        }else{
          return ViewQuestionNetworkDesktop();
        }
        break;
    }
  }
}


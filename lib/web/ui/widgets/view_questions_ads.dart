import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/ui/desktop/quiz_desktop/view_question_ads_desktop.dart';
import 'package:project_enade/web/ui/widgets/responsive.dart';
import 'package:project_enade/web/ui/mobile/quiz_mobile/view_question_ads_mobile.dart';

class ViewQuestionsAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = getFormFactor(context).toString();
    if(screen == "ScreenType.Phone"){
      return ViewQuestionAdsMobile();
    }else{
      return ViewQuestionAdsDesktop();
    }
  }
}

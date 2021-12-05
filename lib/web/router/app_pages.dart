import 'package:project_enade/web/router/app_routes.dart';
import 'package:project_enade/web/ui/mobile/quiz_mobile/widgets/view_quiz_mobile.dart';
import 'package:project_enade/web/ui/view_question_network.dart';
import 'package:project_enade/web/ui/view_questions_ads.dart';
import 'package:project_enade/web/ui/view_register.dart';
import 'package:project_enade/web/ui/view_results.dart';
import 'package:project_enade/web/ui/widgets/initial_page_web.dart';
import 'package:project_enade/web/ui/view_login.dart';

class AppPagesView {

  static final routes = {
    Routes.INITIAL: (_) => InitialPage(),
    Routes.LOGIN: (_) => ViewLogin(),
    Routes.REGISTER: (_) => ViewRegister(),
    Routes.QUIZ_ADS: (_) => ViewQuestionsAds(),
    Routes.QUIZ_NETWORK: (_) => ViewQuestionsNetwork(),
    Routes.RESULTS: (_) => ViewResults(),
    Routes.INITIATE_QUIZ: (_) => SelectorQuiz(),
  };
}
import 'package:project_enade/web/router/app_routes.dart';
import 'package:project_enade/web/ui/widgets/initial_page_web.dart';
import 'package:project_enade/web/ui/mobile/view_quiz_mobile.dart';
import 'package:project_enade/web/ui/widgets/view_login.dart';
import 'package:project_enade/web/ui/widgets/view_question_network.dart';
import 'package:project_enade/web/ui/widgets/view_questions_ads.dart';
import 'package:project_enade/web/ui/widgets/view_register.dart';
import 'package:project_enade/web/ui/widgets/view_results.dart';

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
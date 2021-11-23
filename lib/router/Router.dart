import 'package:flutter/cupertino.dart';
import 'package:project_enade/ui/initial_page.dart';
import 'package:project_enade/ui/view_login.dart';
import 'package:project_enade/ui/view_question_network.dart';
import 'package:project_enade/ui/view_questions_ads.dart';
import 'package:project_enade/ui/view_register.dart';
import 'package:project_enade/ui/view_results.dart';

abstract class Routes{

  static const INITIAL = '/';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const QUIZ_ADS = '/quiz_ads';
  static const QUIZ_NETWORK = '/quiz_redes';
  static const RESULTADOS = '/resultados';
}

class AppPages {

  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (_) => InitialPage(),
    '/login': (_) => ViewLogin(),
    '/register': (_) => ViewRegister(),
    '/quiz_ads': (_) => ViewQuestionsAds(),
    '/quiz_redes': (_) => ViewQuestionsNetwork(),
    '/resultados': (_) => ViewResults(),
  };
}
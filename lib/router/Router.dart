import 'package:flutter/cupertino.dart';
import 'package:project_enade/ui/initial_page.dart';
import 'package:project_enade/ui/view_login.dart';
import 'package:project_enade/ui/view_register.dart';

abstract class Routes{

  static const INITIAL = '/';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
}

class AppPages {

  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (_) => InitialPage(),
    '/login': (_) => ViewLogin(),
    '/register': (_) => ViewRegister(),
  };
}
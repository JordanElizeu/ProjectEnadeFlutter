import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/router/app_routes.dart';
import 'package:project_enade/web/router/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future<FirebaseApp> app = Firebase.initializeApp();
  app.whenComplete(() => {runApp(MyApp())});
}

class MyApp extends StatelessWidget {
  final _title = "Enade - Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MaterialApp(
        initialRoute: Routes.INITIAL,
        routes: AppPagesView.routes,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_enade/ui/initial_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      themeMode: ThemeMode.light,
      home: InitialPage(),
    );
  }
}


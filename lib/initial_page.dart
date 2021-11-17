import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Enade",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Enade"),
          actions: [
            ElevatedButton(onPressed: (){}, child: Text("Entrar"))
          ],
        ),
      ),
    );
  }
}

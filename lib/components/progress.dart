import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String message = "loading";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Padding(padding: EdgeInsets.all(8.0),),
            Text(
              message,
              style: TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}

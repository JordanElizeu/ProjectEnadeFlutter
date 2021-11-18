import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/ui/view_footer.dart';
import 'app_bar.dart';

class InitialPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ViewAppBar(),
              ViewFooter(),
            ],
          ),
        ),
      );
  }
}

Widget bodyInitialPage(){
  return Container(
    child: Card(
      child: Column(
        children: [

        ],
      ),
    ),
  );
}

import 'package:flutter/cupertino.dart';
import '../view_login.dart';

class ViewLoginMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ViewLogin().customDesignViewLogin(context, width: sizeWidth*0.90),
    );
  }
}



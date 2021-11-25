import 'package:flutter/cupertino.dart';
import '../view_register.dart';

class ViewRegisterMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ViewRegister().customViewRegister(context,width: sizeWidth*0.90),
    );
  }
}

import 'package:flutter/cupertino.dart';
import '../view_register.dart';

class ViewRegisterDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double width = sizeWidth * 0.45 < 350
    ? sizeWidth * 0.70
        : sizeWidth * 0.45;
    return ViewRegister().customViewRegister(context,width: width);
  }
}

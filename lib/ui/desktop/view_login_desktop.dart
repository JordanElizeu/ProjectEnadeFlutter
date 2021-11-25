import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../view_login.dart';

class ViewLoginDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double width = sizeWidth * 0.40 > 350
        ? sizeWidth * 0.40
        : sizeWidth * 0.70;
    return ViewLogin().customDesignViewLogin(context, width: width);
    //mudo apenas o width da pagina, pois o conteúdo será o mesmo.
  }
}

import 'package:flutter/cupertino.dart';
import 'inkwell.dart';

Widget linkText(
    {@required image,
    @required Function function,
    @required link,
    @required BuildContext context}) {
  return Container(
    child: Row(
      children: [
        Image.asset(
          image,
          width: 30,
          height: 30,
        ),
        inkwellText(textName: link, function: function),
      ],
    ),
  );
}

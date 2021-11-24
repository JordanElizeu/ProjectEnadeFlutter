import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

class FormFactor {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

ScreenType getFormFactor(BuildContext context) {
  // Use .shortestSide to detect device type regardless of orientation
  double device = MediaQuery.of(context).size.shortestSide;
  double deviceWidth = MediaQuery.of(context).size.width;
  if (device > FormFactor.tablet) return ScreenType.Desktop;
  if (device > FormFactor.handset && deviceWidth < FormFactor.desktop && deviceWidth > FormFactor.tablet) return ScreenType.Tablet;
  if (device > FormFactor.handset && deviceWidth < 450) return ScreenType.Phone;
  return ScreenType.Watch;
}

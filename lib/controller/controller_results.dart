import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/data/firebase.dart';

class ControllerResults extends GetxController{

    Map<dynamic,dynamic> map;

    getResultsAndSendToMap(BuildContext context) async {
      map = await getAllResults(context: context);
    }
}
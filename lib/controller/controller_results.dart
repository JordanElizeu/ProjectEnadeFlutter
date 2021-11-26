import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/data/firebase.dart';

class ControllerResults extends GetxController{

    List<dynamic> list;

    Future<List<dynamic>> getResultsAndSendToMap(BuildContext context) async {
      list.add(await getAllValuesResultsToListResults(context: context));
      update();
      return list;
    }
}
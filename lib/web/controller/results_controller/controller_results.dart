import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_enade/web/data/repository/firebase/repository_database.dart';

class ControllerResults extends GetxController{

    List<dynamic> list;

    Future<List<dynamic>> getResultsAndSendToMap(BuildContext context) async {
      list.add(await RepositoryDatabase().getAllResults(context: context));
      update();
      return list;
    }
}
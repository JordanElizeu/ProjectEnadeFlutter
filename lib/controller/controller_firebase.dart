import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerFirebase extends GetxController{

  bool userIsOn(){
    if(FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser.emailVerified){
      return true;
    }
    return false;
  }

  getUuid(){
    var random = Random.secure();
    var uuid = "";
    for(int x=0; x<8; x++){
      uuid += random.nextInt(10).toString();
    }
    return uuid;
  }
}

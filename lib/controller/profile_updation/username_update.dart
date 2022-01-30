import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UsernameUpdate extends GetxController{

  static final UsernameUpdate usernameUpdateController = Get.find();

  TextEditingController usernameController = TextEditingController();
  TextEditingController newUsernameController = TextEditingController();


  clearUpdateUnameCntrlrs(){
    usernameController.clear();
    newUsernameController.clear();

  }

  @override
  void dispose() {
    usernameUpdateController.dispose();
    newUsernameController.dispose();
    super.dispose();
  }

}
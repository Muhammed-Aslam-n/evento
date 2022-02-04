import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProfileCredentialsController extends GetxController{


  static EditProfileCredentialsController editProfileCredentialsController = Get.find();
  TextEditingController currentEmailController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();

  TextEditingController currentPhonenumber = TextEditingController();
  TextEditingController newPhonenumber = TextEditingController();


  getNewEmailFromUI(){

    String newEmail = newEmailController.text;


  }



  getNewPasswordFromUI(){
    String newPhoneNumber = newEmailController.text;


  }



}
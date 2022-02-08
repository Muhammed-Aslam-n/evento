import 'package:evento/api_helper/services/profile/profile_updation/profile_updation_api.dart';
import 'package:evento/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';

class EditProfileCredentialsController extends GetxController{

  static EditProfileCredentialsController editProfileCredentialController = Get.find();

  static EditProfileCredentialsController editProfileCredentialsController = Get.find();
  TextEditingController currentEmailController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();

  TextEditingController currentPhonenumber = TextEditingController();
  TextEditingController newPhonenumber = TextEditingController();

  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  // List<dynamic> row1Selected = [Icons.arrow_drop_down,primaryColor,];
  List<dynamic> style1 = [Icons.arrow_drop_down,null,];
  List<dynamic> style2 = [Icons.arrow_drop_down,null,Entypo.key];
  List<dynamic> style3 = [Icons.arrow_drop_down,null,];

  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;

  changeEmailIcon(){
    isVisible1=!isVisible1;
    if(isVisible1){
      isVisible2=isVisible3=false;
      isVisible2 ? style2 = [Icons.arrow_drop_up,primaryTextColor,]:style2 = [Icons.arrow_drop_down,null,];
      isVisible3?style3=[Icons.arrow_drop_up,primaryTextColor,]:style3 = [Icons.arrow_drop_down,null,];
    }
    isVisible1 ? style1 = [Icons.arrow_drop_up,primaryTextColor,]:style1 = [Icons.arrow_drop_down,null,];
    update();
  }



  changePassIcon(){
    isVisible2=!isVisible2;
    if(isVisible2){
      isVisible3=isVisible1=false;
      isVisible1 ? style1 = [Icons.arrow_drop_up,primaryTextColor,]:style1 = [Icons.arrow_drop_down,null,];
      isVisible3?style3=[Icons.arrow_drop_up,primaryTextColor,]:style3 = [Icons.arrow_drop_down,null,];
    }
    isVisible2 ? style2 = [Icons.arrow_drop_up,primaryTextColor,]:style2 = [Icons.arrow_drop_down,null,];
    update();
  }


  changePhoneIcon(){
    isVisible3=!isVisible3;
    if(isVisible3){
      isVisible2=isVisible1=false;
      isVisible1 ? style1 = [Icons.arrow_drop_up,primaryTextColor,]:style1 = [Icons.arrow_drop_down,null,];
      isVisible2 ? style2 = [Icons.arrow_drop_up,primaryTextColor,]:style2 = [Icons.arrow_drop_down,null,];
    }
    isVisible3?style3=[Icons.arrow_drop_up,primaryTextColor,]:style3 = [Icons.arrow_drop_down,null,];
    update();
  }

  getNewEmailFromUI(){
    String currentEmail = currentEmailController.text;
    String newEmail = newEmailController.text;
    UpdateProfileAPI().updateEmail(currentEmail: currentEmail,newEmail:newEmail);
  }



  getNewPasswordFromUI(){
    String currentPasswordd = currentPassword.text;
    String newPassword1 = newPassword.text;
    UpdateProfileAPI().updatePassword(currentPassword: currentPasswordd,newPassword: newPassword1);

  }

  getNewPhoneFromUI(){
    String currentPhoneNumber = currentPhonenumber.text;
    String newPhoneNumber = newPhonenumber.text;
    UpdateProfileAPI().updatePhoneNumber(currenytPnum: currentPhoneNumber,newPhoneNumber: newPhoneNumber);
  }

} 
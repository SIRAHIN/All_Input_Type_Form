import 'package:all_type_form_inpuut/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInputController extends GetConnect {
  final userFormData = <UserModel>[].obs;
  

  // For Text Controller Section //
  TextEditingController userNameEditiongController = TextEditingController();
  TextEditingController userPhoneEditingController = TextEditingController();
  

  // For Check Box Section //
  final isGraphicsDesigner = false.obs;
  final isWebDesigner = false.obs;
  final isAppDesigner = false.obs;
  final isGameDesigner = false.obs;

  void toggleGraphicsDesginer() {
    isGraphicsDesigner.value = !isGraphicsDesigner.value;
  }

  void toggleWebDesginer() {
    isWebDesigner.value = !isWebDesigner.value;
  }

  void toggleAppDesginer() {
    isAppDesigner.value = !isAppDesigner.value;
  }

  void toggleGameDesginer() {
    isGameDesigner.value = !isGameDesigner.value;
  }
  

  // For Drop Down Section //
  final experience =
      ['Experience 0-1', 'Experience 2+', 'Experience 3+', 'Experience 4+'].obs;
  final initialExp = 'Experience 0-1'.obs;
  
  // For Multiple toggle Option Section //
  final toggleValue = [false, false, false, false].obs;
  
  // for Switch Button //
  final isVerificationOn = false.obs;
  void toggleVerificatonOn() {
    isVerificationOn.value = !isVerificationOn.value;
  }
  
  // for Radio Button //
  final initalLevel = 'Beginner'.obs;
  void toggleLevel(passValue) {
    initalLevel.value = passValue;
  }
 
 // on submit form func //
  onSubmitForm() {
    userFormData.add(UserModel(
        userName: userNameEditiongController.text,
        userPhone: userPhoneEditingController.text,
        isGD: isGameDesigner.value,
        isWD: isWebDesigner.value,
        isAD: isAppDesigner.value,
        isGAD: isGraphicsDesigner.value,
        exp: initialExp.value,
        expLevel: initalLevel.value,
        needNotification: isVerificationOn.value,
        osType: toggleValue));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameEditiongController.dispose();
    userPhoneEditingController.dispose();
    final initialExp = 'Experience 0-1'.obs;
    final toggleValue = [false, false, false, false].obs;
    final isVerificationOn = false.obs;
    final initalLevel = 'Beginner'.obs;
  }
}

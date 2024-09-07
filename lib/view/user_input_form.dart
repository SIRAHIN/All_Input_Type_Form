import 'package:all_type_form_inpuut/controller/user_input_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserInputForm extends GetView<UserInputController> {
  const UserInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    UserInputController getController =
        Get.put(UserInputController(), permanent: true);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 830,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "User Form",
                      style: TextStyle(fontSize: 30, color: Colors.deepPurple),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.userNameEditiongController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        label: Text('Enter Your Name')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.userPhoneEditingController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      label: Text('Enter Your Phone Number'),
                      prefix: Text('+8801 '),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Please Select You Skills'),
                  Obx(
                    () => CheckboxMenuButton(
                        value: controller.isGraphicsDesigner.value,
                        onChanged: (value) {
                          controller.toggleGraphicsDesginer();
                        },
                        child: const Text('Graphics Design')),
                  ),
                  Obx(
                    () => CheckboxMenuButton(
                        value: controller.isWebDesigner.value,
                        onChanged: (value) {
                          controller.toggleWebDesginer();
                        },
                        child: const Text('Web Design')),
                  ),
                  Obx(
                    () => CheckboxMenuButton(
                        value: controller.isAppDesigner.value,
                        onChanged: (value) {
                          controller.toggleAppDesginer();
                        },
                        child: const Text('App Design')),
                  ),
                  Obx(
                    () => CheckboxMenuButton(
                        value: controller.isGameDesigner.value,
                        onChanged: (value) {
                          controller.toggleGameDesginer();
                        },
                        child: const Text('Game Design')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Please Select You Experience Level'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Obx(() {
                      return DropdownButton<String>(
                        items: controller.experience
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.initialExp.value = value;
                          }
                        },
                        value: controller.initialExp.value,
                      );
                    }),
                  ),
                  Text('Please Select You Expertise Level'),
                  Row(
                    children: [
                      Row(
                        children: [
                          Obx(() => Radio<String>(
                                value: 'Beginner', // Value of this Radio button
                                groupValue: controller.initalLevel
                                    .value, // Observable that stores the selected value
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.toggleLevel(
                                        value); // Update the observable with the selected value
                                   
                                  }
                                },
                              )),
                          const Text('Beginner'),
                        ],
                      ),
                      Row(
                        children: [
                          Obx(() => Radio<String>(
                                value: 'Advanced', // Value of this Radio button
                                groupValue: controller.initalLevel
                                    .value, // Observable that stores the selected value
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.toggleLevel(
                                        value);
                                       // Update the observable with the selected value
                                  }
                                },
                              )),
                          const Text('Advanced'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('Do you want to Enable the Notification'),
                      Transform.scale(
                        scale: 0.5,
                        child: Obx(
                          () => Switch(
                            value: controller.isVerificationOn.value,
                            onChanged: (bool value1) {
                              controller.toggleVerificatonOn();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Please Select you OS'),
                  Obx(
                    () {
                      return ToggleButtons(
                          onPressed: (index) {
                            controller.toggleValue[index] =
                                !controller.toggleValue[index];
                          },
                          children: [
                            Icon(FontAwesomeIcons.apple),
                            Icon(FontAwesomeIcons.windows),
                            Icon(FontAwesomeIcons.linux),
                            Icon(FontAwesomeIcons.android),
                          ],
                          isSelected: controller.toggleValue);
                    },
                  ),

                  const SizedBox(height: 10,),

                  Center(
                    child: SizedBox(
                    width: 180,
                      child: MaterialButton(
                      color: Colors.teal,
                      child: Text('Submit', style: TextStyle(
                       fontSize: 20,
                       color: Colors.white
                      ),),
                      onPressed: () {
                        controller.onSubmitForm();
                      },),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
